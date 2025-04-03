import 'enums.dart';

/// Represents an image on CivitAI.
class ImageModel {
  /// Unique identifier for the image.
  final int id;

  /// URL to the image.
  final String url;

  /// Hash of the image.
  final String? hash;

  /// Width of the image in pixels.
  final int? width;

  /// Height of the image in pixels.
  final int? height;

  /// NSFW level of the image.
  final NsfwLevel? nsfwLevel;

  /// Type of the image.
  final MediaType? type;

  /// Whether the image contains NSFW content.
  final bool? nsfw;

  /// Browsing level for the image.
  final int? browsingLevel;

  /// When the image was created.
  final DateTime? createdAt;

  /// Post ID the image is associated with.
  final int? postId;

  /// Username of the image creator.
  final String? username;

  /// Base model used to create the image.
  final String? baseModel;

  /// The complete meta information from the response.
  final Map<String, dynamic>? meta;

  /// Statistics about the image.
  final ImageStats? stats;

  /// Hashes from the meta (e.g. "hashes": { "model": "67ab2fd8ec", ... }).
  final Map<String, String>? hashes;

  /// Civitai resources converted into a structured map.
  /// The key is the modelVersionId and the value is the resource info.
  final Map<int, CivitaiResource>? modelResources;

  /// Creates a new image instance.
  const ImageModel({
    required this.id,
    required this.url,
    this.hash,
    this.width,
    this.height,
    this.nsfwLevel,
    this.type,
    this.nsfw,
    this.browsingLevel,
    this.createdAt,
    this.postId,
    this.username,
    this.baseModel,
    this.meta,
    this.stats,
    this.hashes,
    this.modelResources,
  });

  /// Creates an image instance from a JSON map.
  factory ImageModel.fromJson(Map<String, dynamic> json) {
    final meta = json['meta'] as Map<String, dynamic>?;

    // Extract the "hashes" field if present.
    Map<String, String>? extractedHashes;
    if (meta != null && meta['hashes'] != null) {
      final rawHashes = meta['hashes'] as Map<String, dynamic>;
      extractedHashes = rawHashes.map((k, v) => MapEntry(k, v as String));
    }

    // Extract the "civitaiResources" list (if present) and convert it into a map
    // keyed by the modelVersionId.
    Map<int, CivitaiResource>? extractedResources;
    if (meta != null && meta['civitaiResources'] != null) {
      final rawResources = meta['civitaiResources'] as List<dynamic>;
      extractedResources = <int, CivitaiResource>{};
      for (final resource in rawResources) {
        if (resource is Map<String, dynamic>) {
          final res = CivitaiResource.fromJson(resource);
          if (res.modelVersionId != null) {
            extractedResources[res.modelVersionId!] = res;
          }
        }
      }
    }

    return ImageModel(
      id: json['id'] as int? ?? 0,
      url: json['url'] as String? ?? 'https://example.com/image.jpg',
      hash: json['hash'] as String?,
      width: json['width'] as int?,
      height: json['height'] as int?,
      nsfwLevel: json['nsfwLevel'] != null
          ? NsfwLevel.fromValue(json['nsfwLevel'])
          : null,
      type: json['type'] != null
          ? MediaType.fromString(json['type'] as String)
          : null,
      nsfw: json['nsfw'] as bool?,
      browsingLevel: json['browsingLevel'] as int?,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : null,
      postId: json['postId'] as int?,
      username: json['username'] as String?,
      baseModel: json['baseModel'] as String?,
      meta: meta,
      stats: json['stats'] != null
          ? ImageStats.fromJson(json['stats'] as Map<String, dynamic>)
          : null,
      hashes: extractedHashes,
      modelResources: extractedResources,
    );
  }

  /// Converts this image to a JSON map.
  Map<String, dynamic> toJson() {
    // Reconstruct the meta map to include the extracted hashes and civitaiResources.
    final metaCopy =
        meta != null ? Map<String, dynamic>.from(meta!) : <String, dynamic>{};
    if (hashes != null) {
      metaCopy['hashes'] = hashes;
    }
    if (modelResources != null) {
      metaCopy['civitaiResources'] =
          modelResources!.values.map((e) => e.toJson()).toList();
    }

    return {
      'id': id,
      'url': url,
      if (hash != null) 'hash': hash,
      if (width != null) 'width': width,
      if (height != null) 'height': height,
      if (nsfwLevel != null) 'nsfwLevel': nsfwLevel!.toJson(),
      if (type != null) 'type': type!.toJson(),
      if (nsfw != null) 'nsfw': nsfw,
      if (browsingLevel != null) 'browsingLevel': browsingLevel,
      if (createdAt != null) 'createdAt': createdAt!.toIso8601String(),
      if (postId != null) 'postId': postId,
      if (username != null) 'username': username,
      if (baseModel != null) 'baseModel': baseModel,
      'meta': metaCopy,
      if (stats != null) 'stats': stats!.toJson(),
    };
  }
}

/// Statistics about an image.
class ImageStats {
  final int cryCount;
  final int laughCount;
  final int likeCount;
  final int dislikeCount;
  final int heartCount;
  final int commentCount;

  const ImageStats({
    required this.cryCount,
    required this.laughCount,
    required this.likeCount,
    required this.dislikeCount,
    required this.heartCount,
    required this.commentCount,
  });

  factory ImageStats.fromJson(Map<String, dynamic> json) {
    return ImageStats(
      cryCount: json['cryCount'] as int? ?? 0,
      laughCount: json['laughCount'] as int? ?? 0,
      likeCount: json['likeCount'] as int? ?? 0,
      dislikeCount: json['dislikeCount'] as int? ?? 0,
      heartCount: json['heartCount'] as int? ?? 0,
      commentCount: json['commentCount'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cryCount': cryCount,
      'laughCount': laughCount,
      'likeCount': likeCount,
      'dislikeCount': dislikeCount,
      'heartCount': heartCount,
      'commentCount': commentCount,
    };
  }
}

/// Represents a resource used to generate an image from CivitAI.
/// This resource can come from a "civitaiResources" entry (with a modelVersionId)
/// or, conceptually, from a "hashes" entry (to be looked up via a hash endpoint).
class CivitaiResource {
  /// Type of the resource (e.g. "checkpoint", "lora").
  final String type;

  /// Optional weight value (useful for LORA resources).
  final double? weight;

  /// The model version ID associated with this resource.
  final int? modelVersionId;

  const CivitaiResource({
    required this.type,
    this.weight,
    this.modelVersionId,
  });

  factory CivitaiResource.fromJson(Map<String, dynamic> json) {
    return CivitaiResource(
      type: json['type'] as String? ?? '',
      weight: (json['weight'] as num?)?.toDouble(),
      modelVersionId: json['modelVersionId'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      if (weight != null) 'weight': weight,
      if (modelVersionId != null) 'modelVersionId': modelVersionId,
    };
  }
}
