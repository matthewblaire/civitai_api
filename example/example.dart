import 'package:civitai_client/civitai_client.dart';

// This example demonstrates how to use the CivitAI API client
// to browse models, search for specific ones, and view images.
void main() async {
  // Create a client (with optional API key for authenticated endpoints)
  final civitai = CivitaiApi(apiKey: 'YOUR_API_KEY');

  try {
    // Example 1: Fetch popular models
    print('Fetching popular Stable Diffusion models...');
    final modelsResponse = await civitai.models.getModels(
      GetModelsParams(
        limit: 15,
        sort: ModelSort.mostDownloaded,
        types: [ModelType.lora],
        nsfw: false,
      ),
    );

    print('Found ${modelsResponse.items.length} models:');
    for (final model in modelsResponse.items) {
      print('\n${model.name} by ${model.creator?.username}');
      print('Type: ${model.type}');

      if (model.modelVersions.isNotEmpty) {
        final latestVersion = model.modelVersions.first;
        print('Latest version: ${latestVersion.name}');
        print('Base model: ${latestVersion.baseModel}');
      }
    }

    // Example 2: Get images for a model
    if (modelsResponse.items.isNotEmpty) {
      final firstModel = modelsResponse.items.first;
      print('\n\nFetching images for ${firstModel.name}...');

      final imagesResponse = await civitai.images.getImages(
        GetImagesParams(
            modelVersionId: firstModel.modelVersions.first.id,
            limit: 3,
            nsfw: true),
      );

      print('Found ${imagesResponse.items.length} images:');
      for (final image in imagesResponse.items) {
        print('\nImage URL: ${image.url}');
        print('Size: ${image.width}x${image.height}');
      }
    }

    // Example 3: Check authentication (if API key provided)
    try {
      print('\n\nChecking authentication...');
      final userResponse = await civitai.users.getCurrentUser();
      print('Authenticated as: ${userResponse.user.username}');
      print('User ID: ${userResponse.user.id}');
      print('User tier: ${userResponse.user.tier}');
    } catch (e) {
      print('Not authenticated or invalid API key');
    }
  } catch (e) {
    print('Error: $e');
  } finally {
    // Always close the client when done
    civitai.close();
  }
}
