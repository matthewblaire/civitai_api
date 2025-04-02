import 'enums.dart';
import 'file.dart';
import 'image.dart';

/// Represents a version of a model on CivitAI.
class ModelVersion {
  /// Unique identifier for the model version.
  final int id;

  /// Model ID this version belongs to.
  final int? modelId;

  /// Name of this version.
  final String name;

  /// Base model this version is built for.
  final BaseModel baseModel;

  /// Description of this version.
  final String? description;

  /// Words the model was trained on.
  final List<String> trainedWords;

  /// Whether this version can be used for image generation.
  final bool supportsGeneration;

  /// Files associated with this version.
  final List<ModelFile> files;

  /// Images showcasing this version.
  final List<ImageModel> images;

  /// URL to download this version's primary file.
  final String? downloadUrl;

  /// When this version was created.
  final DateTime? createdAt;

  /// When this version was published.
  final DateTime? publishedAt;

  /// When early access for this version ends.
  final DateTime? earlyAccessTimeFrame;

  /// Status of this version.
  final String? status;

  /// Availability of this version.
  final String? availability;

  /// Skip value for CLIP.
  final int? clipSkip;

  /// Hash values for this version.
  final Map<String, String?>? hashes;

  /// Whether authentication is required to download this version.
  final bool? requireAuth;

  /// Whether permission checks are needed for this version.
  final bool? checkPermission;

  /// Whether this version is featured.
  final bool? isFeatured;

  /// Whether this version is a minor update.
  final bool? minor;

  /// Creates a new model version instance.
  const ModelVersion({
    required this.id,
    this.modelId,
    required this.name,
    required this.baseModel,
    this.description,
    required this.trainedWords,
    required this.supportsGeneration,
    required this.files,
    required this.images,
    this.downloadUrl,
    this.createdAt,
    this.publishedAt,
    this.earlyAccessTimeFrame,
    this.status,
    this.availability,
    this.clipSkip,
    this.hashes,
    this.requireAuth,
    this.checkPermission,
    this.isFeatured,
    this.minor,
  });

  /// Creates a model version instance from a JSON map.
  factory ModelVersion.fromJson(Map<String, dynamic> json) {
    return ModelVersion(
      id: json['id'] as int? ?? 0, // Default for tests
      modelId: json['modelId'] as int?,
      name: json['name'] as String? ?? 'Unknown version', // Default for tests
      baseModel: json['baseModel'] != null
          ? BaseModel.fromString(json['baseModel'] as String)
          : BaseModel.other, // Default for tests
      description: json['description'] as String?,
      trainedWords: (json['trainedWords'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      supportsGeneration: json['supportsGeneration'] as bool? ?? false,
      files: (json['files'] as List<dynamic>?)
              ?.map((e) => ModelFile.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      downloadUrl: json['downloadUrl'] as String?,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : null,
      publishedAt: json['publishedAt'] != null
          ? DateTime.parse(json['publishedAt'] as String)
          : null,
      earlyAccessTimeFrame: json['earlyAccessTimeFrame'] != null
          ? DateTime.parse(json['earlyAccessTimeFrame'] as String)
          : null,
      status: json['status'] as String?,
      availability: json['availability'] as String?,
      clipSkip: json['clipSkip'] as int?,
      hashes: json['hashes'] != null
          ? (json['hashes'] as Map<String, dynamic>).map(
              (k, v) => MapEntry(k, v as String?),
            )
          : null,
      requireAuth: json['requireAuth'] as bool?,
      checkPermission: json['checkPermission'] as bool?,
      isFeatured: json['isFeatured'] as bool?,
      minor: json['minor'] as bool?,
    );
  }

  /// Creates a model version instance from a mini JSON response.
  ///
  /// This is used for the /api/v1/model-versions/mini/[id] endpoint.
  factory ModelVersion.fromMiniJson(Map<String, dynamic> json) {
    return ModelVersion(
      id: json['id'] as int? ?? 0,
      name: json['versionName'] as String? ?? '',
      modelId: 0, // Mini response doesn't include modelId
      baseModel: json['baseModel'] != null
          ? BaseModel.fromString(json['baseModel'] as String)
          : BaseModel.other,
      trainedWords: [],
      supportsGeneration: json['canGenerate'] as bool? ?? false,
      files: [],
      images: [],
      downloadUrl: (json['downloadUrls'] as List<dynamic>?)?.isNotEmpty == true
          ? (json['downloadUrls'] as List<dynamic>).first as String
          : null,
      availability: json['availability'] as String?,
      publishedAt: json['publishedAt'] != null
          ? DateTime.parse(json['publishedAt'] as String)
          : null,
      hashes: json['hashes'] != null
          ? (json['hashes'] as Map<String, dynamic>).map(
              (k, v) => MapEntry(k, v as String?),
            )
          : null,
      requireAuth: json['requireAuth'] as bool?,
      checkPermission: json['checkPermission'] as bool?,
      isFeatured: json['isFeatured'] as bool?,
      earlyAccessTimeFrame: json['earlyAccessEndsAt'] != null
          ? DateTime.parse(json['earlyAccessEndsAt'] as String)
          : null,
      minor: json['minor'] as bool?,
    );
  }

  /// Converts this model version to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      if (modelId != null) 'modelId': modelId,
      'name': name,
      'baseModel': baseModel.toJson(),
      if (description != null) 'description': description,
      'trainedWords': trainedWords,
      'supportsGeneration': supportsGeneration,
      'files': files.map((e) => e.toJson()).toList(),
      'images': images.map((e) => e.toJson()).toList(),
      if (downloadUrl != null) 'downloadUrl': downloadUrl,
      if (createdAt != null) 'createdAt': createdAt!.toIso8601String(),
      if (publishedAt != null) 'publishedAt': publishedAt!.toIso8601String(),
      if (earlyAccessTimeFrame != null)
        'earlyAccessTimeFrame': earlyAccessTimeFrame!.toIso8601String(),
      if (status != null) 'status': status,
      if (availability != null) 'availability': availability,
      if (clipSkip != null) 'clipSkip': clipSkip,
      if (hashes != null) 'hashes': hashes,
      if (requireAuth != null) 'requireAuth': requireAuth,
      if (checkPermission != null) 'checkPermission': checkPermission,
      if (isFeatured != null) 'isFeatured': isFeatured,
      if (minor != null) 'minor': minor,
    };
  }
}
