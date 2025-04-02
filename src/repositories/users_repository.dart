import '../api/api.dart';
import '../models/models.dart';
import '../utils/retry_policy.dart';

/// Repository for interacting with the Users API.
class UsersRepository {
  /// API client for making requests.
  final ApiClient _apiClient;
  
  /// Retry policy for transient errors.
  final RetryPolicy _retryPolicy;

  /// Creates a new users repository.
  UsersRepository(
    this._apiClient, {
    RetryPolicy? retryPolicy,
  }) : _retryPolicy = retryPolicy ?? const RetryPolicy();

  /// Retrieves a list of users.
  ///
  /// [params] - Parameters for the request.
  Future<GetUsersResponse> getUsers([GetUsersParams? params]) async {
    return _retryPolicy.execute(() async {
      final queryParams = params?.toQueryParameters() ?? {};
      
      final json = await _apiClient.get(
        '/v1/users',
        queryParams: queryParams,
      );
      
      return GetUsersResponse.fromJson(json);
    });
  }

  /// Retrieves the current authenticated user.
  ///
  /// Requires authentication.
  Future<GetCurrentUserResponse> getCurrentUser() async {
    return _retryPolicy.execute(() async {
      final json = await _apiClient.get(
        '/v1/me',
        requiresAuth: true,
      );
      
      return GetCurrentUserResponse.fromJson(json);
    });
  }
}