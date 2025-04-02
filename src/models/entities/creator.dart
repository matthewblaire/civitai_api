/// Represents a creator on CivitAI.
class Creator {
  /// Username of the creator.
  final String username;
  
  /// URL to the creator's profile image.
  final String? image;
  
  /// Unique identifier for the creator.
  final int? id;
  
  /// Count of models uploaded by the creator.
  final int? modelCount;
  
  /// Link to the creator's models.
  final String? link;

  /// Creates a new creator instance.
  const Creator({
    required this.username,
    this.image,
    this.id,
    this.modelCount,
    this.link,
  });

  /// Creates a creator instance from a JSON map.
  factory Creator.fromJson(Map<String, dynamic> json) {
    return Creator(
      username: json['username'] as String,
      image: json['image'] as String?,
      id: json['id'] as int?,
      modelCount: json['modelCount'] as int?,
      link: json['link'] as String?,
    );
  }

  /// Converts this creator to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      if (image != null) 'image': image,
      if (id != null) 'id': id,
      if (modelCount != null) 'modelCount': modelCount,
      if (link != null) 'link': link,
    };
  }
}