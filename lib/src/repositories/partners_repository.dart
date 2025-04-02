import '../api/api.dart';
import '../utils/retry_policy.dart';

/// Repository for interacting with the Partners API.
class PartnersRepository {
  /// API client for making requests.
  final ApiClient _apiClient;

  /// Retry policy for transient errors.
  final RetryPolicy _retryPolicy;

  /// Creates a new partners repository.
  PartnersRepository(
    this._apiClient, {
    RetryPolicy? retryPolicy,
  }) : _retryPolicy = retryPolicy ?? const RetryPolicy();

  /// Generates a partner token.
  ///
  /// Requires authentication.
  Future<String> generateToken() async {
    return _retryPolicy.execute(() async {
      final json = await _apiClient.get(
        '/v1/partners/generate-token',
        requiresAuth: true,
      );

      return json['token'] as String;
    });
  }

  /// Retrieves supported models for partner services.
  Future<List<Map<String, dynamic>>> getSupportedModels() async {
    return _retryPolicy.execute(() async {
      final json = await _apiClient.get('/v1/partners/supported-models');

      return (json['models'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList();
    });
  }
}
