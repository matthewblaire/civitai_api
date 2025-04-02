import 'dart:async';
import 'dart:math' as math;

import '../exceptions/exceptions.dart';

/// Configuration for retry behavior.
class RetryConfig {
  /// Maximum number of retry attempts.
  final int maxRetries;

  /// Base delay between retries in milliseconds.
  final int baseDelayMs;

  /// Maximum delay between retries in milliseconds.
  final int maxDelayMs;

  /// List of exception types that should trigger a retry.
  final List<Type> retryableExceptions;

  /// Creates a new retry configuration.
  ///
  /// [maxRetries] - Maximum number of retry attempts. Default is 3.
  /// [baseDelayMs] - Base delay between retries in milliseconds. Default is 1000ms (1 second).
  /// [maxDelayMs] - Maximum delay between retries in milliseconds. Default is 10000ms (10 seconds).
  /// [retryableExceptions] - List of exception types that should trigger a retry.
  ///   Default includes network errors, timeouts, and server errors.
  const RetryConfig({
    this.maxRetries = 3,
    this.baseDelayMs = 1000,
    this.maxDelayMs = 10000,
    this.retryableExceptions = const [
      CivitaiNetworkException,
      CivitaiTimeoutException,
      CivitaiServerException,
    ],
  });
}

/// Utility for executing functions with retry logic.
class RetryPolicy {
  /// Retry configuration.
  final RetryConfig config;

  /// Creates a new retry policy with the given [config].
  const RetryPolicy({this.config = const RetryConfig()});

  /// Executes a function with retry logic.
  ///
  /// If the function throws an exception that matches one of the retryable
  /// exception types, it will be retried up to [maxRetries] times with
  /// an exponential backoff delay between retries.
  ///
  /// Returns the result of the function execution.
  /// Throws the last exception if all retry attempts fail.
  Future<T> execute<T>(Future<T> Function() fn) async {
    var attempt = 0;
    dynamic lastException;

    while (attempt <= config.maxRetries) {
      try {
        return await fn();
      } catch (e) {
        lastException = e;

        // Check if exception is retryable
        final isRetryable = config.retryableExceptions.any(
          (type) => e.runtimeType == type,
        );

        if (!isRetryable || attempt >= config.maxRetries) {
          rethrow;
        }

        // Calculate delay with exponential backoff and jitter
        final delay = _calculateDelay(attempt);

        // Wait before the next retry
        await Future.delayed(Duration(milliseconds: delay));

        attempt++;
      }
    }

    // This should never be reached due to the rethrow above,
    // but is included for completeness
    throw lastException as Object;
  }

  /// Calculates the delay for the current retry attempt using exponential
  /// backoff with jitter.
  int _calculateDelay(int attempt) {
    // Calculate exponential backoff: baseDelay * 2^attempt
    final exponentialDelay = config.baseDelayMs * math.pow(2, attempt).toInt();

    // Cap at maximum delay
    final cappedDelay = math.min(exponentialDelay, config.maxDelayMs);

    // Add jitter (±20%)
    final jitterFactor = 0.8 + (math.Random().nextDouble() * 0.4);

    return (cappedDelay * jitterFactor).toInt();
  }
}
