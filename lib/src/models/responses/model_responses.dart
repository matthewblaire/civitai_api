import '../../utils/pagination.dart';
import '../entities/model.dart';

/// Response for the models endpoint.
class GetModelsResponse extends PaginatedResponse<Model> {
  /// Creates a new get models response.
  const GetModelsResponse({
    required super.items,
    required super.metadata,
  });

  /// Creates a get models response from a JSON map.
  factory GetModelsResponse.fromJson(Map<String, dynamic> json) {
    final items = (json['items'] as List<dynamic>)
        .map((e) => Model.fromJson(e as Map<String, dynamic>))
        .toList();

    final metadata = PaginationMetadata.fromJson(
      json['metadata'] as Map<String, dynamic>,
    );

    return GetModelsResponse(
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

/// Response for the get model by ID endpoint.
class GetModelResponse {
  /// The model details.
  final Model model;

  /// Creates a new get model response.
  const GetModelResponse({
    required this.model,
  });

  /// Creates a get model response from a JSON map.
  factory GetModelResponse.fromJson(Map<String, dynamic> json) {
    return GetModelResponse(
      model: Model.fromJson(json),
    );
  }

  /// Converts this response to a JSON map.
  Map<String, dynamic> toJson() {
    return model.toJson();
  }
}
