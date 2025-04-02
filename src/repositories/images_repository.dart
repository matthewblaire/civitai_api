import '../api/api.dart';
import '../models/models.dart';
import '../utils/retry_policy.dart';

/// Repository for interacting with the Images API.
class ImagesRepository {
  /// API client for making requests.
  final ApiClient _apiClient;
  
  /// Retry policy for transient errors.
  final RetryPolicy _retryPolicy;

  /// Creates a new images repository.
  ImagesRepository(
    this._apiClient, {
    RetryPolicy? retryPolicy,
  }) : _retryPolicy = retryPolicy ?? const RetryPolicy();

  /// Retrieves a list of images.
  ///
  /// [params] - Parameters for the request.
  Future<GetImagesResponse> getImages([GetImagesParams? params]) async {
    return _retryPolicy.execute(() async {
      final queryParams = params?.toQueryParameters() ?? {};
      
      final json = await _apiClient.get(
        '/v1/images',
        queryParams: queryParams,
      );
      
      return GetImagesResponse.fromJson(json);
    });
  }
}