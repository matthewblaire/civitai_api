import '../entities/enums.dart';

/// Parameters for retrieving a model version by hash.
class GetModelVersionByHashParams {
  /// The hash of the model file to search for.
  final String hash;

  /// The type of hash used.
  final String? hashType;

  /// Creates parameters for retrieving a model version by hash.
  const GetModelVersionByHashParams({
    required this.hash,
    this.hashType,
  });

  /// Converts these parameters to a map for use in query parameters.
  Map<String, dynamic> toQueryParameters() {
    final params = <String, dynamic>{};

    if (hashType != null) params['hashType'] = hashType;

    return params;
  }
}

/// Parameters for retrieving model versions by hash IDs.
class GetModelVersionsByHashIdsParams {
  /// The list of hashes to search for.
  final List<String> hashes;

  /// The type of hash used.
  final String? hashType;

  /// Creates parameters for retrieving model versions by hash IDs.
  const GetModelVersionsByHashIdsParams({
    required this.hashes,
    this.hashType,
  });

  /// Converts these parameters to a map for use in query parameters.
  Map<String, dynamic> toQueryParameters() {
    final params = <String, dynamic>{
      'hashes': hashes.join(','),
    };

    if (hashType != null) params['hashType'] = hashType;

    return params;
  }
}
