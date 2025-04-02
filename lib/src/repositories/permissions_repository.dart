import '../api/api.dart';
import '../models/models.dart';
import '../utils/parameter_builder.dart';
import '../utils/retry_policy.dart';

/// Repository for interacting with the Permissions API.
class PermissionsRepository {
  /// API client for making requests.
  final ApiClient _apiClient;

  /// Retry policy for transient errors.
  final RetryPolicy _retryPolicy;

  /// Creates a new permissions repository.
  PermissionsRepository(
    this._apiClient, {
    RetryPolicy? retryPolicy,
  }) : _retryPolicy = retryPolicy ?? const RetryPolicy();

  /// Checks permissions for entities.
  ///
  /// [entityType] - The type of entity to check permissions for.
  /// [entityIds] - The IDs of the entities to check permissions for.
  /// [permission] - The permission to check.
  /// [userId] - The optional user ID to check permissions for.
  Future<CheckPermissionsResponse> checkPermissions({
    EntityType entityType = EntityType.modelVersion,
    required List<int> entityIds,
    PermissionType permission = PermissionType.generate,
    int? userId,
  }) async {
    return _retryPolicy.execute(() async {
      final params = <String, dynamic>{
        'entityType': entityType.toString().split('.').last,
        'entityIds': entityIds.join(','),
        'permission': permission.toString().split('.').last,
      };

      if (userId != null) {
        params['userId'] = userId;
      }

      final json = await _apiClient.get(
        '/v1/permissions/check',
        queryParams: params,
      );

      return CheckPermissionsResponse.fromJson(json);
    });
  }
}
