import '../../utils/pagination.dart';
import '../entities/creator.dart';

/// Response for the creators endpoint.
class GetCreatorsResponse extends PaginatedResponse<Creator> {
  /// Creates a new get creators response.
  const GetCreatorsResponse({
    required super.items,
    required super.metadata,
  });

  /// Creates a get creators response from a JSON map.
  factory GetCreatorsResponse.fromJson(Map<String, dynamic> json) {
    final items = (json['items'] as List<dynamic>)
        .map((e) => Creator.fromJson(e as Map<String, dynamic>))
        .toList();

    final metadata = PaginationMetadata.fromJson(
      json['metadata'] as Map<String, dynamic>,
    );

    return GetCreatorsResponse(
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
