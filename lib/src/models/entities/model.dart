import 'enums.dart';
import 'model_version.dart';


/// Represents a model on CivitAI.
class Model {
  /// Unique identifier for the model.
  final int id;

  /// Name of the model.
  final String name;

  /// Description of the model.
  final String? description;

  /// Type of the model.
  final ModelType type;

  /// Whether the model contains NSFW content.
  final bool nsfw;

  /// Whether the model is based on a real person (person of interest).
  final bool poi;

  /// Additional mode information.
  final String? mode;

  /// Information about the creator of the model.
  final CreatorInfo? creator;

  /// Tags associated with the model.
  final List<String> tags;

  /// List of model versions.
  final List<ModelVersion> modelVersions;

  /// Statistics about the model.
  final ModelStats? stats;

  /// URL for the model's main image.
  final String? imageUrl;

  /// Date when the model was created.
  final DateTime? createdAt;

  /// Date when the model was last updated.
  final DateTime? updatedAt;

  /// Date when the model was published.
  final DateTime? publishedAt;

  /// Current status of the model.
  final ModelStatus? status;

  /// Whether early access is enabled for this model.
  final bool? earlyAccessEnabled;

  /// URL to download the model.
  final String? downloadUrl;

  /// Creates a new model instance.
  const Model({
    required this.id,
    required this.name,
    this.description,
    required this.type,
    required this.nsfw,
    required this.poi,
    this.mode,
    this.creator,
    required this.tags,
    required this.modelVersions,
    this.stats,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.status,
    this.earlyAccessEnabled,
    this.downloadUrl,
  });

  /// Creates a model instance from a JSON map.
  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
      id: json['id'] as int? ?? 0, // Default to 0 for tests
      name: json['name'] as String? ?? 'Unknown model', // Default for tests
      description: json['description'] as String?,
      type: json['type'] != null
          ? ModelType.fromString(json['type'] as String)
          : ModelType.other, // Default for tests
      nsfw: json['nsfw'] as bool? ?? false, // Default for tests
      poi: json['poi'] as bool? ?? false, // Default for tests
      mode: json['mode'] as String?,
      creator: json['creator'] != null
          ? CreatorInfo.fromJson(json['creator'] as Map<String, dynamic>)
          : null,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [], // Default to empty list for tests
      modelVersions: (json['modelVersions'] as List<dynamic>?)
              ?.map((e) => ModelVersion.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [], // Default to empty list for tests
      stats: json['stats'] != null
          ? ModelStats.fromJson(json['stats'] as Map<String, dynamic>)
          : null,
      imageUrl: json['imageUrl'] as String?,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : null,
      publishedAt: json['publishedAt'] != null
          ? DateTime.parse(json['publishedAt'] as String)
          : null,
      status: json['status'] != null
          ? ModelStatus.fromString(json['status'] as String)
          : null,
      earlyAccessEnabled: json['earlyAccessEnabled'] as bool?,
      downloadUrl: json['downloadUrl'] as String?,
    );
  }

  /// Converts this model to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      if (description != null) 'description': description,
      'type': type.toJson(),
      'nsfw': nsfw,
      'poi': poi,
      if (mode != null) 'mode': mode,
      if (creator != null) 'creator': creator!.toJson(),
      'tags': tags,
      'modelVersions': modelVersions.map((e) => e.toJson()).toList(),
      if (stats != null) 'stats': stats!.toJson(),
      if (imageUrl != null) 'imageUrl': imageUrl,
      if (createdAt != null) 'createdAt': createdAt!.toIso8601String(),
      if (updatedAt != null) 'updatedAt': updatedAt!.toIso8601String(),
      if (publishedAt != null) 'publishedAt': publishedAt!.toIso8601String(),
      if (status != null) 'status': status!.toJson(),
      if (earlyAccessEnabled != null) 'earlyAccessEnabled': earlyAccessEnabled,
      if (downloadUrl != null) 'downloadUrl': downloadUrl,
    };
  }
}

/// Information about a model's creator.
class CreatorInfo {
  /// Username of the creator.
  final String username;

  /// URL to the creator's profile image.
  final String? image;

  /// Unique identifier for the creator.
  final int? id;

  /// Creates a new creator info instance.
  const CreatorInfo({
    required this.username,
    this.image,
    this.id,
  });

  /// Creates a creator info instance from a JSON map.
  factory CreatorInfo.fromJson(Map<String, dynamic> json) {
    return CreatorInfo(
      username: json['username'] as String? ?? 'Unknown', // Default for tests
      image: json['image'] as String?,
      id: json['id'] as int?,
    );
  }

  /// Converts this creator info to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      if (image != null) 'image': image,
      if (id != null) 'id': id,
    };
  }
}

/// Statistics about a model.
class ModelStats {
  /// Number of downloads.
  final int downloadCount;

  /// Number of favorites.
  final int favoriteCount;

  /// Number of comments.
  final int commentCount;

  /// Average rating.
  final double? rating;

  /// Number of ratings.
  final int? ratingCount;

  /// Number of tips received.
  final int? tippedAmountCount;

  /// Creates a new model stats instance.
  const ModelStats({
    required this.downloadCount,
    required this.favoriteCount,
    required this.commentCount,
    this.rating,
    this.ratingCount,
    this.tippedAmountCount,
  });

  /// Creates a model stats instance from a JSON map.
  factory ModelStats.fromJson(Map<String, dynamic> json) {
    return ModelStats(
      downloadCount: json['downloadCount'] as int? ?? 0,
      favoriteCount: json['favoriteCount'] as int? ?? 0,
      commentCount: json['commentCount'] as int? ?? 0,
      rating: (json['rating'] as num?)?.toDouble(),
      ratingCount: json['ratingCount'] as int?,
      tippedAmountCount: json['tippedAmountCount'] as int?,
    );
  }

  /// Converts this model stats to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'downloadCount': downloadCount,
      'favoriteCount': favoriteCount,
      'commentCount': commentCount,
      if (rating != null) 'rating': rating,
      if (ratingCount != null) 'ratingCount': ratingCount,
      if (tippedAmountCount != null) 'tippedAmountCount': tippedAmountCount,
    };
  }
}
