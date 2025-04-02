import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'models/models.dart';
import 'repositories/repositories.dart';
import 'api/api.dart';
import 'exceptions/exceptions.dart';
import 'utils/utils.dart';
import 'utils/authentication.dart';

/// Main entry point for the CivitAI API client.
///
/// This class provides access to all CivitAI APIs through a single interface.
/// It should be instantiated once and reused throughout your application.
///
/// ```dart
/// final civitai = CivitaiApi(apiKey: 'YOUR_API_KEY');
/// final models = await civitai.models.getModels(limit: 10);
/// ```
class CivitaiApi {
  /// The base URL for the CivitAI API.
  final String baseUrl;
  
  /// HTTP client used for all API requests.
  final http.Client _httpClient;
  
  /// Authentication configuration for the API.
  final AuthConfig? authConfig;
  
  /// Whether to follow redirects automatically.
  final bool followRedirects;
  
  /// Request timeout duration.
  final Duration timeout;

  late final ModelsRepository _modelsRepository;
  late final ModelVersionsRepository _modelVersionsRepository;
  late final ImagesRepository _imagesRepository;
  late final UsersRepository _usersRepository;
  late final TagsRepository _tagsRepository;
  late final CreatorsRepository _creatorsRepository;
  late final PermissionsRepository _permissionsRepository;
  late final UploadRepository _uploadRepository;
  late final ContentRepository _contentRepository;
  late final EnumsRepository _enumsRepository;
  late final PartnersRepository _partnersRepository;
  late final VaultRepository _vaultRepository;

  /// Creates a new CivitAI API client.
  ///
  /// [apiKey] - Optional API key for authentication. This is a convenience parameter
  ///            that creates an AuthConfig with the API key method.
  /// [authConfig] - Optional authentication configuration with method and scopes.
  ///                If both apiKey and authConfig are provided, authConfig takes precedence.
  /// [baseUrl] - The base URL for the API. Defaults to 'https://civitai.com/api'.
  /// [httpClient] - An optional custom HTTP client.
  /// [followRedirects] - Whether to follow redirects. Defaults to true.
  /// [timeout] - Request timeout. Defaults to 30 seconds.
  CivitaiApi({
    String? apiKey,
    this.authConfig,
    this.baseUrl = 'https://civitai.com/api',
    http.Client? httpClient,
    this.followRedirects = true,
    this.timeout = const Duration(seconds: 30),
  }) : _httpClient = httpClient ?? http.Client() {
    // Use authConfig if provided, otherwise create from apiKey if available
    final effectiveAuthConfig = authConfig ?? 
        (apiKey != null ? AuthConfig.apiKey(apiKey) : null);
    
    final apiClient = ApiClient(
      baseUrl: baseUrl,
      httpClient: _httpClient,
      authConfig: effectiveAuthConfig,
      followRedirects: followRedirects,
      timeout: timeout,
    );

    _modelsRepository = ModelsRepository(apiClient);
    _modelVersionsRepository = ModelVersionsRepository(apiClient);
    _imagesRepository = ImagesRepository(apiClient);
    _usersRepository = UsersRepository(apiClient);
    _tagsRepository = TagsRepository(apiClient);
    _creatorsRepository = CreatorsRepository(apiClient);
    _permissionsRepository = PermissionsRepository(apiClient);
    _uploadRepository = UploadRepository(apiClient);
    _contentRepository = ContentRepository(apiClient);
    _enumsRepository = EnumsRepository(apiClient);
    _partnersRepository = PartnersRepository(apiClient);
    _vaultRepository = VaultRepository(apiClient);
  }

  /// Access to models-related API endpoints.
  ModelsRepository get models => _modelsRepository;

  /// Access to model versions-related API endpoints.
  ModelVersionsRepository get modelVersions => _modelVersionsRepository;

  /// Access to images-related API endpoints.
  ImagesRepository get images => _imagesRepository;

  /// Access to users-related API endpoints.
  UsersRepository get users => _usersRepository;

  /// Access to tags-related API endpoints.
  TagsRepository get tags => _tagsRepository;

  /// Access to creators-related API endpoints.
  CreatorsRepository get creators => _creatorsRepository;

  /// Access to permissions-related API endpoints.
  PermissionsRepository get permissions => _permissionsRepository;

  /// Access to upload-related API endpoints.
  UploadRepository get upload => _uploadRepository;

  /// Access to content-related API endpoints.
  ContentRepository get content => _contentRepository;

  /// Access to enums-related API endpoints.
  EnumsRepository get enums => _enumsRepository;

  /// Access to partners-related API endpoints.
  PartnersRepository get partners => _partnersRepository;

  /// Access to vault-related API endpoints.
  VaultRepository get vault => _vaultRepository;

  /// Closes the HTTP client and releases resources.
  void close() {
    _httpClient.close();
  }
}