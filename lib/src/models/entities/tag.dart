import 'enums.dart';

/// Represents a tag on CivitAI.
class Tag {
  /// Unique identifier for the tag.
  final int id;
  
  /// Name of the tag.
  final String name;
  
  /// NSFW level of the tag.
  final NsfwLevel? nsfwLevel;
  
  /// Count of models with this tag.
  final int? modelCount;
  
  /// Count of images with this tag.
  final int? imageCount;
  
  /// Count of posts with this tag.
  final int? postCount;
  
  /// Whether this tag is a category.
  final bool? isCategory;
  
  /// Link to search for this tag.
  final String? link;

  /// Creates a new tag instance.
  const Tag({
    required this.id,
    required this.name,
    this.nsfwLevel,
    this.modelCount,
    this.imageCount,
    this.postCount,
    this.isCategory,
    this.link,
  });

  /// Creates a tag instance from a JSON map.
  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      id: json['id'] as int,
      name: json['name'] as String,
      nsfwLevel: json['nsfwLevel'] != null
          ? NsfwLevel.fromValue(json['nsfwLevel'])
          : null,
      modelCount: json['modelCount'] as int?,
      imageCount: json['imageCount'] as int?,
      postCount: json['postCount'] as int?,
      isCategory: json['isCategory'] as bool?,
      link: json['link'] as String?,
    );
  }

  /// Converts this tag to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      if (nsfwLevel != null) 'nsfwLevel': nsfwLevel!.toJson(),
      if (modelCount != null) 'modelCount': modelCount,
      if (imageCount != null) 'imageCount': imageCount,
      if (postCount != null) 'postCount': postCount,
      if (isCategory != null) 'isCategory': isCategory,
      if (link != null) 'link': link,
    };
  }
}