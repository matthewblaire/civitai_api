/// Base exception class for all CivitAI API exceptions.
class CivitaiException implements Exception {
  /// Human-readable error message.
  final String message;
  
  /// Original error data from the API, if available.
  final Map<String, dynamic>? data;

  /// Creates a new CivitAI API exception.
  CivitaiException(this.message, [this.data]);

  @override
  String toString() => 'CivitaiException: $message';
}

/// Exception thrown when a request fails due to a client error (4xx).
class CivitaiClientException extends CivitaiException {
  /// HTTP status code of the response.
  final int statusCode;

  /// Creates a new client exception with the given [message] and [statusCode].
  CivitaiClientException(String message, this.statusCode, [Map<String, dynamic>? data])
      : super(message, data);

  @override
  String toString() => 'CivitaiClientException ($statusCode): $message';
}

/// Exception thrown when a request fails due to a server error (5xx).
class CivitaiServerException extends CivitaiException {
  /// Creates a new server exception with the given [message].
  CivitaiServerException(String message, [Map<String, dynamic>? data])
      : super(message, data);

  @override
  String toString() => 'CivitaiServerException: $message';
}

/// Exception thrown when a request fails due to a network error.
class CivitaiNetworkException extends CivitaiException {
  /// Creates a new network exception with the given [message].
  CivitaiNetworkException(String message) : super(message);

  @override
  String toString() => 'CivitaiNetworkException: $message';
}

/// Exception thrown when a request times out.
class CivitaiTimeoutException extends CivitaiException {
  /// Creates a new timeout exception with the given [message].
  CivitaiTimeoutException(String message) : super(message);

  @override
  String toString() => 'CivitaiTimeoutException: $message';
}

/// Exception thrown when parsing a response fails.
class CivitaiParsingException extends CivitaiException {
  /// Creates a new parsing exception with the given [message].
  CivitaiParsingException(String message) : super(message);

  @override
  String toString() => 'CivitaiParsingException: $message';
}

/// Exception thrown for any API errors not covered by more specific exceptions.
class CivitaiApiException extends CivitaiException {
  /// HTTP status code of the response.
  final int statusCode;

  /// Creates a new API exception with the given [message] and [statusCode].
  CivitaiApiException(String message, this.statusCode, [Map<String, dynamic>? data])
      : super(message, data);

  @override
  String toString() => 'CivitaiApiException ($statusCode): $message';
}

/// Exception thrown when an HTTP 400 (Bad Request) response is received.
class CivitaiBadRequestException extends CivitaiClientException {
  /// Creates a new bad request exception with the given [message].
  CivitaiBadRequestException(String message, [Map<String, dynamic>? data])
      : super(message, 400, data);

  @override
  String toString() => 'CivitaiBadRequestException: $message';
}

/// Exception thrown when an HTTP 401 (Unauthorized) response is received.
class CivitaiUnauthorizedException extends CivitaiClientException {
  /// Creates a new unauthorized exception with the given [message].
  CivitaiUnauthorizedException(String message, [Map<String, dynamic>? data])
      : super(message, 401, data);

  @override
  String toString() => 'CivitaiUnauthorizedException: $message';
}

/// Exception thrown when an HTTP 403 (Forbidden) response is received.
class CivitaiForbiddenException extends CivitaiClientException {
  /// Creates a new forbidden exception with the given [message].
  CivitaiForbiddenException(String message, [Map<String, dynamic>? data])
      : super(message, 403, data);

  @override
  String toString() => 'CivitaiForbiddenException: $message';
}

/// Exception thrown when an HTTP 404 (Not Found) response is received.
class CivitaiNotFoundException extends CivitaiClientException {
  /// Creates a new not found exception with the given [message].
  CivitaiNotFoundException(String message, [Map<String, dynamic>? data])
      : super(message, 404, data);

  @override
  String toString() => 'CivitaiNotFoundException: $message';
}

/// Exception thrown when an HTTP 409 (Conflict) response is received.
class CivitaiConflictException extends CivitaiClientException {
  /// Creates a new conflict exception with the given [message].
  CivitaiConflictException(String message, [Map<String, dynamic>? data])
      : super(message, 409, data);

  @override
  String toString() => 'CivitaiConflictException: $message';
}

/// Exception thrown when an HTTP 429 (Too Many Requests) response is received.
class CivitaiRateLimitException extends CivitaiClientException {
  /// Creates a new rate limit exception with the given [message].
  CivitaiRateLimitException(String message, [Map<String, dynamic>? data])
      : super(message, 429, data);

  @override
  String toString() => 'CivitaiRateLimitException: $message';
}

/// Exception thrown when the API response doesn't match the expected format.
class CivitaiUnexpectedResponseException extends CivitaiException {
  /// Creates a new unexpected response exception with the given [message].
  CivitaiUnexpectedResponseException(String message, [Map<String, dynamic>? data])
      : super(message, data);

  @override
  String toString() => 'CivitaiUnexpectedResponseException: $message';
}

/// Exception thrown when an unknown error occurs.
class CivitaiUnknownException extends CivitaiException {
  /// Creates a new unknown exception with the given [message].
  CivitaiUnknownException(String message, [Map<String, dynamic>? data])
      : super(message, data);

  @override
  String toString() => 'CivitaiUnknownException: $message';
}