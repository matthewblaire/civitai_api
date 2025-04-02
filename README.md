# CivitAI API Client for Dart

A comprehensive, production-ready Dart client for the [CivitAI](https://civitai.com) API. This package provides complete type-safe access to all CivitAI API endpoints, with comprehensive error handling, pagination support, and more.

## Features

- **Complete API Coverage**: Implements all CivitAI API endpoints
- **Type Safety**: Strongly typed request parameters and response models
- **Robust Error Handling**: Detailed exception hierarchy for better error handling
- **Pagination Support**: Handles both cursor-based and page-based pagination
- **Retry Logic**: Automatic retries for transient failures with exponential backoff
- **Authentication**: Support for API key authentication

## Installation

```yaml
dependencies:
  civitai_api: ^1.0.0
```

## Quick Start

```dart
import 'package:civitai_api/civitai_api.dart';

void main() async {
  // Create a client (with optional API key for authenticated endpoints)
  final civitai = CivitaiApi(apiKey: 'YOUR_API_KEY');
  
  try {
    // Fetch popular models
    final modelsResponse = await civitai.models.getModels(
      GetModelsParams(
        limit: 10,
        sort: ModelSort.mostDownloaded,
        nsfw: false,
      ),
    );
    
    // Print model names
    for (final model in modelsResponse.items) {
      print('${model.name} by ${model.creator?.username}');
    }
  } catch (e) {
    print('Error: $e');
  } finally {
    // Close the client when done
    civitai.close();
  }
}
```

## Authentication

The CivitAI API uses API keys for authentication. You can obtain an API key from your CivitAI account settings.

```dart
final civitai = CivitaiApi(apiKey: 'YOUR_API_KEY');
```

Some endpoints require authentication (like accessing your favorites), while others work without authentication.

## API Sections

The client is organized by API section:

- `models`: Access model listings and details
- `modelVersions`: Access model version information
- `images`: Browse and search images
- `users`: Query user information
- `tags`: Access model and image tags
- `creators`: Browse model creators
- `permissions`: Check permissions for models and images
- `upload`: Upload images and files
- `content`: Access static content
- `enums`: Get enumeration values
- `partners`: Access partner API functions
- `vault`: Manage your model vault

## Examples

### Browse Models

```dart
// Get LoRA models for Stable Diffusion XL
final modelsResponse = await civitai.models.getModels(
  GetModelsParams(
    types: [ModelType.lora],
    baseModels: [BaseModel.sdxl],
    sort: ModelSort.mostDownloaded,
    limit: 20,
  ),
);

// Access pagination metadata
if (modelsResponse.hasMore) {
  // Load next page
  final nextPageResponse = await civitai.models.getModels(
    GetModelsParams(
      cursor: modelsResponse.metadata.nextCursor,
      types: [ModelType.lora],
      baseModels: [BaseModel.sdxl],
      sort: ModelSort.mostDownloaded,
      limit: 20,
    ),
  );
}
```

### Get Images for a Model

```dart
// Fetch images for a specific model
final imagesResponse = await civitai.images.getImages(
  GetImagesParams(
    modelId: 12345,
    nsfw: NsfwLevel.none,
    limit: 10,
  ),
);

// Display image URLs
for (final image in imagesResponse.items) {
  print('Image URL: ${image.url}');
}
```

### Check User Information

```dart
// Get current authenticated user
final userResponse = await civitai.users.getCurrentUser();
print('Logged in as: ${userResponse.user.username}');

// Search for users
final usersResponse = await civitai.users.getUsers(
  GetUsersParams(
    username: 'search_term',
    limit: 10,
  ),
);
```

## Advanced Usage

### Custom HTTP Client

You can provide your own HTTP client for custom configuration:

```dart
import 'package:http/http.dart' as http;

final client = http.Client();
final civitai = CivitaiApi(
  apiKey: 'YOUR_API_KEY',
  httpClient: client,
  timeout: Duration(seconds: 60),
);
```

### Custom Retry Policy

Configure retry behavior for transient errors:

```dart
import 'package:civitai_api/civitai_api.dart';

final retryConfig = RetryConfig(
  maxRetries: 5,
  baseDelayMs: 500,
  maxDelayMs: 5000,
);

// Use custom retry policy for a specific repository
final apiClient = ApiClient(baseUrl: 'https://civitai.com/api');
final modelVersionsWithRetry = ModelVersionsRepository(
  apiClient,
  retryPolicy: RetryPolicy(config: retryConfig),
);
```

## Error Handling

The client provides a detailed exception hierarchy for better error handling:

```dart
try {
  final response = await civitai.models.getModel(12345);
  // Handle successful response
} on CivitaiNotFoundException {
  // Handle 404 - Model not found
} on CivitaiUnauthorizedException {
  // Handle 401 - Authentication required
} on CivitaiForbiddenException {
  // Handle 403 - Insufficient permissions
} on CivitaiRateLimitException {
  // Handle 429 - Rate limit exceeded
} on CivitaiServerException {
  // Handle 5xx - Server errors
} on CivitaiNetworkException {
  // Handle network connectivity issues
} on CivitaiTimeoutException {
  // Handle request timeout
} on CivitaiException catch (e) {
  // Handle any other API error
  print('API error: ${e.message}');
} catch (e) {
  // Handle unexpected errors
}
```

## Flutter Integration

### BLoC/Cubit Example

```dart
class ModelsBloc extends Cubit<ModelsState> {
  final CivitaiApi _api;
  
  ModelsBloc(this._api) : super(ModelsInitial());
  
  Future<void> loadModels() async {
    try {
      emit(ModelsLoading());
      final models = await _api.models.getModels(GetModelsParams(limit: 20));
      emit(ModelsLoaded(models));
    } on CivitaiException catch (e) {
      emit(ModelsError(e.message));
    }
  }
}
```

### Provider Example

```dart
final civitaiProvider = Provider<CivitaiApi>((ref) {
  final api = CivitaiApi(apiKey: 'YOUR_API_KEY');
  ref.onDispose(() => api.close());
  return api;
});

final modelsProvider = FutureProvider<List<Model>>((ref) async {
  final api = ref.watch(civitaiProvider);
  final response = await api.models.getModels(GetModelsParams(limit: 20));
  return response.items;
});
```

## License

MIT

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.