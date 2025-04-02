import '../../utils/pagination.dart';
import '../entities/image.dart';

/// Response for the images endpoint.
class GetImagesResponse extends PaginatedResponse<ImageModel> {
  /// Creates a new get images response.
  const GetImagesResponse({
    required super.items,
    required super.metadata,
  });

  /// Creates a get images response from a JSON map.
  factory GetImagesResponse.fromJson(Map<String, dynamic> json) {
    final items = (json['items'] as List<dynamic>)
        .map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
        .toList();

    final metadata = PaginationMetadata.fromJson(
      json['metadata'] as Map<String, dynamic>,
    );

    return GetImagesResponse(
      items: items,
      metadata: metadata,
    );
  }

  /// Converts this response to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'items': items.map((item) => item.toJson()).toList(),
      'metadata': metadata.toJson(),
    };
  }
}
