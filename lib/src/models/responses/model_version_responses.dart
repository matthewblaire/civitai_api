import '../entities/model_version.dart';

/// Response for the get model version by ID endpoint.
class GetModelVersionResponse {
  /// The model version details.
  final ModelVersion modelVersion;

  /// Creates a new get model version response.
  const GetModelVersionResponse({
    required this.modelVersion,
  });

  /// Creates a get model version response from a JSON map.
  factory GetModelVersionResponse.fromJson(Map<String, dynamic> json) {
    return GetModelVersionResponse(
      modelVersion: ModelVersion.fromJson(json),
    );
  }

  /// Converts this response to a JSON map.
  Map<String, dynamic> toJson() {
    return modelVersion.toJson();
  }
}

/// Response for the get model version by hash endpoint.
class GetModelVersionByHashResponse {
  /// The model version details.
  final ModelVersion modelVersion;

  /// Creates a new get model version by hash response.
  const GetModelVersionByHashResponse({
    required this.modelVersion,
  });

  /// Creates a get model version by hash response from a JSON map.
  factory GetModelVersionByHashResponse.fromJson(Map<String, dynamic> json) {
    return GetModelVersionByHashResponse(
      modelVersion: ModelVersion.fromJson(json),
    );
  }

  /// Converts this response to a JSON map.
  Map<String, dynamic> toJson() {
    return modelVersion.toJson();
  }
}

/// Response for the get model versions by hash IDs endpoint.
class GetModelVersionsByHashIdsResponse {
  /// Map of hashes to model versions.
  final Map<String, ModelVersion?> modelVersions;

  /// Creates a new get model versions by hash IDs response.
  const GetModelVersionsByHashIdsResponse({
    required this.modelVersions,
  });

  /// Creates a get model versions by hash IDs response from a JSON map.
  factory GetModelVersionsByHashIdsResponse.fromJson(Map<String, dynamic> json) {
    final modelVersions = <String, ModelVersion?>{};
    
    json.forEach((key, value) {
      if (value != null) {
        modelVersions[key] = ModelVersion.fromJson(value as Map<String, dynamic>);
      } else {
        modelVersions[key] = null;
      }
    });
    
    return GetModelVersionsByHashIdsResponse(
      modelVersions: modelVersions,
    );
  }

  /// Converts this response to a JSON map.
  Map<String, dynamic> toJson() {
    return modelVersions.map(
      (key, value) => MapEntry(key, value?.toJson()),
    );
  }
}

/// Response for the get model version mini endpoint.
class GetModelVersionMiniResponse {
  /// The model version details.
  final ModelVersion modelVersion;

  /// Creates a new get model version mini response.
  const GetModelVersionMiniResponse({
    required this.modelVersion,
  });

  /// Creates a get model version mini response from a JSON map.
  factory GetModelVersionMiniResponse.fromJson(Map<String, dynamic> json) {
    return GetModelVersionMiniResponse(
      modelVersion: ModelVersion.fromMiniJson(json),
    );
  }

  /// Converts this response to a JSON map.
  Map<String, dynamic> toJson() {
    return modelVersion.toJson();
  }
}