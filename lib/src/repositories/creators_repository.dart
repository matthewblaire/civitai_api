import '../api/api.dart';
import '../models/models.dart';
import '../utils/pagination.dart';
import '../utils/retry_policy.dart';

/// Repository for interacting with the Creators API.
class CreatorsRepository {
  /// API client for making requests.
  final ApiClient _apiClient;

  /// Retry policy for transient errors.
  final RetryPolicy _retryPolicy;

  /// Creates a new creators repository.
  CreatorsRepository(
    this._apiClient, {
    RetryPolicy? retryPolicy,
  }) : _retryPolicy = retryPolicy ?? const RetryPolicy();

  /// Retrieves a list of creators.
  ///
  /// [params] - Parameters for the request.
  Future<GetCreatorsResponse> getCreators([PaginationParams? params]) async {
    return _retryPolicy.execute(() async {
      final queryParams = params?.toQueryParameters() ?? {};

      final json = await _apiClient.get(
        '/v1/creators',
        queryParams: queryParams,
      );

      return GetCreatorsResponse.fromJson(json);
    });
  }
}
