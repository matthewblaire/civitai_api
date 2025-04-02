import 'enums.dart';

/// Represents a file associated with a model version on CivitAI.
class ModelFile {
  /// Unique identifier for the file.
  final int id;
  
  /// Name of the file.
  final String name;
  
  /// Size of the file in kilobytes.
  final double sizeKB;
  
  /// Type of the file.
  final FileType type;
  
  /// Hash values for the file.
  final Map<String, String>? hashes;
  
  /// URL to download the file.
  final String? downloadUrl;
  
  /// Whether this is the primary file for the model version.
  final bool? primary;
  
  /// Metadata about the file.
  final Map<String, dynamic>? metadata;

  /// Creates a new model file instance.
  const ModelFile({
    required this.id,
    required this.name,
    required this.sizeKB,
    required this.type,
    this.hashes,
    this.downloadUrl,
    this.primary,
    this.metadata,
  });

  /// Creates a model file instance from a JSON map.
  factory ModelFile.fromJson(Map<String, dynamic> json) {
    return ModelFile(
      id: json['id'] as int,
      name: json['name'] as String,
      sizeKB: (json['sizeKB'] as num).toDouble(),
      type: FileType.fromString(json['type'] as String),
      hashes: json['hashes'] != null
          ? (json['hashes'] as Map<String, dynamic>).map(
              (k, v) => MapEntry(k, v as String),
            )
          : null,
      downloadUrl: json['downloadUrl'] as String?,
      primary: json['primary'] as bool?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );
  }

  /// Converts this model file to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'sizeKB': sizeKB,
      'type': type.toJson(),
      if (hashes != null) 'hashes': hashes,
      if (downloadUrl != null) 'downloadUrl': downloadUrl,
      if (primary != null) 'primary': primary,
      if (metadata != null) 'metadata': metadata,
    };
  }
}