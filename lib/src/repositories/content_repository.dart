import '../api/api.dart';
import '../utils/retry_policy.dart';

/// Repository for interacting with the Content API.
class ContentRepository {
  /// API client for making requests.
  final ApiClient _apiClient;
  
  /// Retry policy for transient errors.
  final RetryPolicy _retryPolicy;

  /// Creates a new content repository.
  ContentRepository(
    this._apiClient, {
    RetryPolicy? retryPolicy,
  }) : _retryPolicy = retryPolicy ?? const RetryPolicy();

  /// Retrieves content by slug.
  ///
  /// [slug] - The slug of the content to retrieve.
  Future<Map<String, dynamic>> getContent(List<String> slug) async {
    return _retryPolicy.execute(() async {
      final path = slug.join('/');
      return await _apiClient.get('/v1/content/$path');
    });
  }
}