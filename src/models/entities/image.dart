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
  
  /// Metadata about the image.
  final Map<String, dynamic>? meta;
  
  /// Statistics about the image.
  final ImageStats? stats;

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
  });

  /// Creates an image instance from a JSON map.
  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      id: json['id'] as int,
      url: json['url'] as String,
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
      meta: json['meta'] as Map<String, dynamic>?,
      stats: json['stats'] != null
          ? ImageStats.fromJson(json['stats'] as Map<String, dynamic>)
          : null,
    );
  }

  /// Converts this image to a JSON map.
  Map<String, dynamic> toJson() {
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
      if (meta != null) 'meta': meta,
      if (stats != null) 'stats': stats!.toJson(),
    };
  }
}

/// Statistics about an image.
class ImageStats {
  /// Number of cry reactions.
  final int cryCount;
  
  /// Number of laugh reactions.
  final int laughCount;
  
  /// Number of like reactions.
  final int likeCount;
  
  /// Number of dislike reactions.
  final int dislikeCount;
  
  /// Number of heart reactions.
  final int heartCount;
  
  /// Number of comments.
  final int commentCount;

  /// Creates a new image stats instance.
  const ImageStats({
    required this.cryCount,
    required this.laughCount,
    required this.likeCount,
    required this.dislikeCount,
    required this.heartCount,
    required this.commentCount,
  });

  /// Creates an image stats instance from a JSON map.
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

  /// Converts this image stats to a JSON map.
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