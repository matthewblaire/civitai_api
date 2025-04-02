/// Authentication methods supported by the CivitAI API.
enum AuthMethod {
  /// API key authentication using a token parameter in the URL.
  apiKey,
  
  /// Bearer token authentication using the Authorization header.
  bearer
}

/// API key scopes for the CivitAI API.
enum ApiScope {
  /// Read-only access.
  read,
  
  /// Write access for creating and updating content.
  write,
  
  /// Permission to use for image generation.
  generate
}

/// Authentication configuration for the CivitAI API.
class AuthConfig {
  /// Token or API key for authentication.
  final String token;
  
  /// Authentication method to use.
  final AuthMethod method;
  
  /// Scopes for the API key.
  final List<ApiScope> scopes;

  /// Creates a new authentication configuration.
  ///
  /// [token] - Token or API key for authentication.
  /// [method] - Authentication method to use.
  /// [scopes] - Scopes for the API key.
  const AuthConfig({
    required this.token,
    this.method = AuthMethod.apiKey,
    this.scopes = const [ApiScope.read],
  });

  /// Creates an API key authentication configuration.
  ///
  /// [apiKey] - API key for authentication.
  /// [scopes] - Scopes for the API key.
  factory AuthConfig.apiKey(String apiKey, {List<ApiScope> scopes = const [ApiScope.read]}) {
    return AuthConfig(
      token: apiKey,
      method: AuthMethod.apiKey,
      scopes: scopes,
    );
  }

  /// Creates a bearer token authentication configuration.
  ///
  /// [token] - Bearer token for authentication.
  factory AuthConfig.bearer(String token) {
    return AuthConfig(
      token: token,
      method: AuthMethod.bearer,
      scopes: const [ApiScope.read, ApiScope.write, ApiScope.generate],
    );
  }

  /// Whether this authentication configuration has a specific scope.
  bool hasScope(ApiScope scope) => scopes.contains(scope);
}