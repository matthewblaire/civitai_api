import '../entities/enums.dart';

/// Parameters for retrieving a model version by hash.
class GetModelVersionByHashParams {
  /// The hash of the model file to search for.
  final String hash;

  /// The type of hash used.
  final ModelHashType hashType;

  /// Creates parameters for retrieving a model version by hash.
  const GetModelVersionByHashParams({
    required this.hash,
    this.hashType = ModelHashType.sha256,
  });

  /// Converts these parameters to a map for use in query parameters.
  Map<String, dynamic> toQueryParameters() {
    final params = <String, dynamic>{
      'hashType': hashType.toJson(),
    };

    return params;
  }
}

/// Parameters for retrieving model versions by hash IDs.
class GetModelVersionsByHashIdsParams {
  /// The list of hashes to search for.
  final List<String> hashes;

  /// The type of hash used.
  final ModelHashType hashType;

  /// Creates parameters for retrieving model versions by hash IDs.
  const GetModelVersionsByHashIdsParams({
    required this.hashes,
    this.hashType = ModelHashType.sha256,
  });

  /// Converts these parameters to a map for use in query parameters.
  Map<String, dynamic> toQueryParameters() {
    final params = <String, dynamic>{
      'hashType': hashType.toJson(),
    };

    return params;
  }

  /// Converts this object to JSON for request body.
  List<String> toRequestBody() {
    return hashes.map((hash) => hash.toUpperCase()).toList();
  }
}
