import '../api/api.dart';
import '../utils/retry_policy.dart';

/// Repository for interacting with the Vault API.
class VaultRepository {
  /// API client for making requests.
  final ApiClient _apiClient;

  /// Retry policy for transient errors.
  final RetryPolicy _retryPolicy;

  /// Creates a new vault repository.
  VaultRepository(
    this._apiClient, {
    RetryPolicy? retryPolicy,
  }) : _retryPolicy = retryPolicy ?? const RetryPolicy();

  /// Retrieves all vaulted models for the current user.
  ///
  /// Requires authentication.
  Future<List<Map<String, dynamic>>> getAll() async {
    return _retryPolicy.execute(() async {
      final json = await _apiClient.get(
        '/v1/vault/all',
        requiresAuth: true,
      );

      return (json['items'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList();
    });
  }

  /// Checks if a model version is in the vault.
  ///
  /// [versionId] - The ID of the model version to check.
  /// Requires authentication.
  Future<bool> checkVault(int versionId) async {
    return _retryPolicy.execute(() async {
      final json = await _apiClient.get(
        '/v1/vault/check-vault',
        queryParams: {'versionId': versionId},
        requiresAuth: true,
      );

      return json['inVault'] as bool;
    });
  }

  /// Toggles a model version in the vault.
  ///
  /// [versionId] - The ID of the model version to toggle.
  /// Requires authentication.
  Future<bool> toggleVersion(int versionId) async {
    return _retryPolicy.execute(() async {
      final json = await _apiClient.get(
        '/v1/vault/toggle-version',
        queryParams: {'versionId': versionId},
        requiresAuth: true,
      );

      return json['inVault'] as bool;
    });
  }
}
