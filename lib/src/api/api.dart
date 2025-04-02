import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

// Export all necessary API-related classes
export 'endpoints/models_api.dart';
export 'endpoints/model_versions_api.dart';
export 'endpoints/images_api.dart';
export 'endpoints/users_api.dart';
export 'endpoints/tags_api.dart';
export 'endpoints/creators_api.dart';
export 'endpoints/permissions_api.dart';
export 'endpoints/upload_api.dart';
export 'endpoints/content_api.dart';
export 'endpoints/enums_api.dart';
export 'endpoints/partners_api.dart';
export 'endpoints/vault_api.dart';

import '../exceptions/exceptions.dart';
import '../utils/utils.dart';
import '../utils/authentication.dart';

/// Core API client handling HTTP requests to the CivitAI API.
class ApiClient {
  /// The base URL for the CivitAI API.
  final String baseUrl;

  /// HTTP client for making requests.
  final http.Client httpClient;

  /// Authentication configuration for the API.
  final AuthConfig? authConfig;

  /// Whether to follow redirects automatically.
  final bool followRedirects;

  /// Request timeout duration.
  final Duration timeout;

  /// Creates a new API client instance.
  ApiClient({
    required this.baseUrl,
    required this.httpClient,
    this.authConfig,
    this.followRedirects = true,
    this.timeout = const Duration(seconds: 30),
  });

  /// Makes a GET request to the specified [endpoint].
  ///
  /// [endpoint] - The API endpoint path (e.g., '/v1/models').
  /// [queryParams] - Optional query parameters to include in the request.
  /// [requiresAuth] - Whether the endpoint requires authentication.
  /// [requiredScope] - The required scope for the API key.
  Future<Map<String, dynamic>> get(
    String endpoint, {
    Map<String, dynamic>? queryParams,
    bool requiresAuth = false,
    ApiScope requiredScope = ApiScope.read,
  }) async {
    _validateAuth(requiresAuth, requiredScope);

    final uri = _buildUri(endpoint, queryParams);
    final headers = _buildHeaders(requiresAuth);

    print(uri.toString());

    try {
      final response =
          await httpClient.get(uri, headers: headers).timeout(timeout);
      return _handleResponse(response);
    } on TimeoutException {
      throw CivitaiTimeoutException(
        'Request to $endpoint timed out after ${timeout.inSeconds} seconds',
      );
    } catch (e) {
      if (e is CivitaiException) rethrow;
      throw CivitaiNetworkException('Network error: ${e.toString()}');
    }
  }

  /// Makes a POST request to the specified [endpoint].
  ///
  /// [endpoint] - The API endpoint path (e.g., '/v1/image-upload').
  /// [body] - The request body to send.
  /// [queryParams] - Optional query parameters to include in the request.
  /// [requiresAuth] - Whether the endpoint requires authentication.
  /// [requiredScope] - The required scope for the API key.
  Future<Map<String, dynamic>> post(
    String endpoint, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParams,
    bool requiresAuth = false,
    ApiScope requiredScope = ApiScope.write,
  }) async {
    _validateAuth(requiresAuth, requiredScope);

    final uri = _buildUri(endpoint, queryParams);
    final headers = _buildHeaders(requiresAuth);

    try {
      final response = await httpClient
          .post(
            uri,
            headers: headers,
            body: body != null ? jsonEncode(body) : null,
          )
          .timeout(timeout);
      return _handleResponse(response);
    } on TimeoutException {
      throw CivitaiTimeoutException(
        'Request to $endpoint timed out after ${timeout.inSeconds} seconds',
      );
    } catch (e) {
      if (e is CivitaiException) rethrow;
      throw CivitaiNetworkException('Network error: ${e.toString()}');
    }
  }

  /// Makes a PUT request to the specified [endpoint].
  ///
  /// [endpoint] - The API endpoint path.
  /// [body] - The request body to send.
  /// [queryParams] - Optional query parameters to include in the request.
  /// [requiresAuth] - Whether the endpoint requires authentication.
  /// [requiredScope] - The required scope for the API key.
  Future<Map<String, dynamic>> put(
    String endpoint, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParams,
    bool requiresAuth = false,
    ApiScope requiredScope = ApiScope.write,
  }) async {
    _validateAuth(requiresAuth, requiredScope);

    final uri = _buildUri(endpoint, queryParams);
    final headers = _buildHeaders(requiresAuth);

    try {
      final response = await httpClient
          .put(
            uri,
            headers: headers,
            body: body != null ? jsonEncode(body) : null,
          )
          .timeout(timeout);
      return _handleResponse(response);
    } on TimeoutException {
      throw CivitaiTimeoutException(
        'Request to $endpoint timed out after ${timeout.inSeconds} seconds',
      );
    } catch (e) {
      if (e is CivitaiException) rethrow;
      throw CivitaiNetworkException('Network error: ${e.toString()}');
    }
  }

  /// Makes a DELETE request to the specified [endpoint].
  ///
  /// [endpoint] - The API endpoint path.
  /// [queryParams] - Optional query parameters to include in the request.
  /// [requiresAuth] - Whether the endpoint requires authentication.
  /// [requiredScope] - The required scope for the API key.
  Future<Map<String, dynamic>> delete(
    String endpoint, {
    Map<String, dynamic>? queryParams,
    bool requiresAuth = false,
    ApiScope requiredScope = ApiScope.write,
  }) async {
    _validateAuth(requiresAuth, requiredScope);

    final uri = _buildUri(endpoint, queryParams);
    final headers = _buildHeaders(requiresAuth);

    try {
      final response =
          await httpClient.delete(uri, headers: headers).timeout(timeout);
      return _handleResponse(response);
    } on TimeoutException {
      throw CivitaiTimeoutException(
        'Request to $endpoint timed out after ${timeout.inSeconds} seconds',
      );
    } catch (e) {
      if (e is CivitaiException) rethrow;
      throw CivitaiNetworkException('Network error: ${e.toString()}');
    }
  }

  /// Validates that the authentication configuration has the required scope.
  void _validateAuth(bool requiresAuth, ApiScope requiredScope) {
    if (requiresAuth) {
      if (authConfig == null) {
        throw CivitaiUnauthorizedException(
          'Authentication required but no authentication configuration provided',
        );
      }

      if (!authConfig!.hasScope(requiredScope)) {
        throw CivitaiForbiddenException(
          'API key does not have the required scope: ${requiredScope.toString().split('.').last}',
        );
      }
    }
  }

  /// Builds the full URI for an API request.
  Uri _buildUri(String endpoint, Map<String, dynamic>? queryParams) {
    final Map<String, dynamic> params = {};

    // Add API key to query parameters if available and using API key auth
    if (authConfig != null && authConfig!.method == AuthMethod.apiKey) {
      params['token'] = authConfig!.token;
    }

    // Add additional query parameters if provided
    if (queryParams != null) {
      params.addAll(queryParams);
    }

    // Convert all param values to strings
    final stringParams = params.map((key, value) {
      if (value is List) {
        return MapEntry(key, value.join(','));
      }
      return MapEntry(key, value.toString());
    });

    // Remove null and empty values
    final cleanParams = Map<String, String>.from(stringParams)
      ..removeWhere((key, value) => value.isEmpty);

    final baseEndpoint = endpoint.startsWith('/') ? endpoint : '/$endpoint';
    return Uri.parse('$baseUrl$baseEndpoint')
        .replace(queryParameters: cleanParams.isNotEmpty ? cleanParams : null);
  }

  /// Builds the HTTP headers for an API request.
  Map<String, String> _buildHeaders(bool requiresAuth) {
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    // Add API key as Authorization header if using bearer auth
    if (requiresAuth &&
        authConfig != null &&
        authConfig!.method == AuthMethod.bearer) {
      headers['Authorization'] = 'Bearer ${authConfig!.token}';
    }

    return headers;
  }

  /// Handles the HTTP response and converts it to JSON or throws an appropriate exception.
  Map<String, dynamic> _handleResponse(http.Response response) {
    final statusCode = response.statusCode;
    final body = response.body;

    if (statusCode >= 200 && statusCode < 300) {
      if (body.isEmpty) {
        return {};
      }

      try {
        return jsonDecode(body) as Map<String, dynamic>;
      } catch (e) {
        throw CivitaiParsingException('Failed to parse response: $body');
      }
    } else {
      _handleErrorResponse(statusCode, body);
      // This line should never be reached
      throw CivitaiUnknownException('Unknown error occurred');
    }
  }

  /// Handles error responses and throws appropriate exceptions.
  void _handleErrorResponse(int statusCode, String body) {
    Map<String, dynamic>? errorData;
    String message = 'Unknown error';

    try {
      if (body.isNotEmpty) {
        errorData = jsonDecode(body) as Map<String, dynamic>;
        message = errorData?['message'] as String? ?? 'Unknown error';
      }
    } catch (_) {
      message = body.isNotEmpty ? body : 'Unknown error';
    }

    switch (statusCode) {
      case 400:
        throw CivitaiBadRequestException(message, errorData);
      case 401:
        throw CivitaiUnauthorizedException(message, errorData);
      case 403:
        throw CivitaiForbiddenException(message, errorData);
      case 404:
        throw CivitaiNotFoundException(message, errorData);
      case 409:
        throw CivitaiConflictException(message, errorData);
      case 429:
        throw CivitaiRateLimitException(message, errorData);
      case 500:
      case 502:
      case 503:
      case 504:
        throw CivitaiServerException(message, errorData);
      default:
        throw CivitaiApiException(
          'API Error ($statusCode): $message',
          statusCode,
          errorData,
        );
    }
  }
}
