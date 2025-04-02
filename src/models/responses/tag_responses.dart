import '../../utils/pagination.dart';
import '../entities/tag.dart';

/// Response for the tags endpoint.
class GetTagsResponse extends PaginatedResponse<Tag> {
  /// Creates a new get tags response.
  const GetTagsResponse({
    required super.items,
    required super.metadata,
  });

  /// Creates a get tags response from a JSON map.
  factory GetTagsResponse.fromJson(Map<String, dynamic> json) {
    final items = (json['items'] as List<dynamic>)
        .map((e) => Tag.fromJson(e as Map<String, dynamic>))
        .toList();
    
    final metadata = PaginationMetadata.fromJson(
      json['metadata'] as Map<String, dynamic>,
    );
    
    return GetTagsResponse(
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