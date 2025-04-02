import '../api/api.dart';
import '../models/models.dart';
import '../utils/pagination.dart';
import '../utils/retry_policy.dart';

/// Repository for interacting with the Tags API.
class TagsRepository {
  /// API client for making requests.
  final ApiClient _apiClient;

  /// Retry policy for transient errors.
  final RetryPolicy _retryPolicy;

  /// Creates a new tags repository.
  TagsRepository(
    this._apiClient, {
    RetryPolicy? retryPolicy,
  }) : _retryPolicy = retryPolicy ?? const RetryPolicy();

  /// Retrieves a list of tags.
  ///
  /// [params] - Parameters for the request.
  Future<GetTagsResponse> getTags([PaginationParams? params]) async {
    return _retryPolicy.execute(() async {
      final queryParams = params?.toQueryParameters() ?? {};

      final json = await _apiClient.get(
        '/v1/tags',
        queryParams: queryParams,
      );

      return GetTagsResponse.fromJson(json);
    });
  }
}
