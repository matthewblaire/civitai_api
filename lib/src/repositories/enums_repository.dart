import '../api/api.dart';
import '../models/models.dart';
import '../utils/retry_policy.dart';

/// Repository for interacting with the Enums API.
class EnumsRepository {
  /// API client for making requests.
  final ApiClient _apiClient;

  /// Retry policy for transient errors.
  final RetryPolicy _retryPolicy;

  /// Creates a new enums repository.
  EnumsRepository(
    this._apiClient, {
    RetryPolicy? retryPolicy,
  }) : _retryPolicy = retryPolicy ?? const RetryPolicy();

  /// Retrieves all enums.
  Future<GetEnumsResponse> getEnums() async {
    return _retryPolicy.execute(() async {
      final json = await _apiClient.get('/v1/enums');
      return GetEnumsResponse.fromJson(json);
    });
  }
}
