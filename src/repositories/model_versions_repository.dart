import '../api/api.dart';
import '../models/models.dart';
import '../utils/retry_policy.dart';

/// Repository for interacting with the Model Versions API.
class ModelVersionsRepository {
  /// API client for making requests.
  final ApiClient _apiClient;
  
  /// Retry policy for transient errors.
  final RetryPolicy _retryPolicy;

  /// Creates a new model versions repository.
  ModelVersionsRepository(
    this._apiClient, {
    RetryPolicy? retryPolicy,
  }) : _retryPolicy = retryPolicy ?? const RetryPolicy();

  /// Retrieves a model version by ID.
  ///
  /// [id] - The ID of the model version to retrieve.
  Future<GetModelVersionResponse> getModelVersion(int id) async {
    return _retryPolicy.execute(() async {
      final json = await _apiClient.get('/v1/model-versions/$id');
      return GetModelVersionResponse.fromJson(json);
    });
  }

  /// Retrieves a model version by hash.
  ///
  /// [hash] - The hash of the model file to search for.
  /// [params] - Additional parameters for the request.
  Future<GetModelVersionByHashResponse> getModelVersionByHash(
    String hash, [
    GetModelVersionByHashParams? params,
  ]) async {
    return _retryPolicy.execute(() async {
      final queryParams = params?.toQueryParameters() ?? {};
      
      final json = await _apiClient.get(
        '/v1/model-versions/by-hash/$hash',
        queryParams: queryParams,
      );
      
      return GetModelVersionByHashResponse.fromJson(json);
    });
  }

  /// Retrieves model versions by hash IDs.
  ///
  /// [params] - Parameters for the request.
  Future<GetModelVersionsByHashIdsResponse> getModelVersionsByHashIds(
    GetModelVersionsByHashIdsParams params,
  ) async {
    return _retryPolicy.execute(() async {
      final json = await _apiClient.get(
        '/v1/model-versions/by-hash/ids',
        queryParams: params.toQueryParameters(),
      );
      
      return GetModelVersionsByHashIdsResponse.fromJson(json);
    });
  }

  /// Retrieves a mini version of a model version by ID.
  ///
  /// [id] - The ID of the model version to retrieve.
  Future<GetModelVersionMiniResponse> getModelVersionMini(int id) async {
    return _retryPolicy.execute(() async {
      final json = await _apiClient.get('/v1/model-versions/mini/$id');
      return GetModelVersionMiniResponse.fromJson(json);
    });
  }
}