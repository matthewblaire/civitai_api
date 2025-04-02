import '../api/api.dart';
import '../models/models.dart';
import '../utils/retry_policy.dart';

/// Repository for interacting with the Upload API.
class UploadRepository {
  /// API client for making requests.
  final ApiClient _apiClient;
  
  /// Retry policy for transient errors.
  final RetryPolicy _retryPolicy;

  /// Creates a new upload repository.
  UploadRepository(
    this._apiClient, {
    RetryPolicy? retryPolicy,
  }) : _retryPolicy = retryPolicy ?? const RetryPolicy();

  /// Creates an image upload request.
  ///
  /// Requires authentication.
  Future<ImageUploadResponse> createImageUpload() async {
    return _retryPolicy.execute(() async {
      final json = await _apiClient.post(
        '/v1/image-upload',
        requiresAuth: true,
      );
      
      return ImageUploadResponse.fromJson(json);
    });
  }

  /// Creates a multipart upload request.
  ///
  /// [params] - Parameters for the request.
  /// Requires authentication.
  Future<MultipartUploadResponse> createMultipartUpload(
    CreateMultipartUploadParams params,
  ) async {
    return _retryPolicy.execute(() async {
      final json = await _apiClient.post(
        '/v1/image-upload/multipart',
        body: params.toJson(),
        requiresAuth: true,
      );
      
      return MultipartUploadResponse.fromJson(json);
    });
  }
}