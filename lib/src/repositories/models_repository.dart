import '../api/api.dart';
import '../models/models.dart';
import '../utils/retry_policy.dart';

/// Repository for interacting with the Models API.
class ModelsRepository {
  /// API client for making requests.
  final ApiClient _apiClient;

  /// Retry policy for transient errors.
  final RetryPolicy _retryPolicy;

  /// Creates a new models repository.
  ModelsRepository(
    this._apiClient, {
    RetryPolicy? retryPolicy,
  }) : _retryPolicy = retryPolicy ?? const RetryPolicy();

  /// Retrieves a list of models.
  ///
  /// [params] - Parameters for the request.
  Future<GetModelsResponse> getModels([GetModelsParams? params]) async {
    return _retryPolicy.execute(() async {
      final queryParams = params?.toQueryParameters() ?? {};

      final json = await _apiClient.get(
        '/v1/models',
        queryParams: queryParams,
        requiresAuth: params?.favorites == true || params?.hidden == true,
      );

      return GetModelsResponse.fromJson(json);
    });
  }

  /// Retrieves a model by ID.
  ///
  /// [id] - The ID of the model to retrieve.
  Future<GetModelResponse> getModel(int id) async {
    return _retryPolicy.execute(() async {
      final json = await _apiClient.get('/v1/models/$id');
      return GetModelResponse.fromJson(json);
    });
  }
}
