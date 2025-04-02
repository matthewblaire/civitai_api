/// Represents a user on CivitAI.
class User {
  /// Unique identifier for the user.
  final int id;

  /// Username of the user.
  final String? username;

  /// URL to the user's profile image.
  final String? image;

  /// User's subscription tier.
  final String? tier;

  /// User's status.
  final String? status;

  /// Whether the user is a moderator.
  final bool? isModerator;

  /// Date when the user was created.
  final DateTime? createdAt;

  /// User's display name.
  final String? displayName;

  /// User's file preferences.
  final UserFilePreferences? filePreferences;

  /// Whether the user is currently banned.
  final bool? banned;

  /// Creates a new user instance.
  const User({
    required this.id,
    this.username,
    this.image,
    this.tier,
    this.status,
    this.isModerator,
    this.createdAt,
    this.displayName,
    this.filePreferences,
    this.banned,
  });

  /// Creates a user instance from a JSON map.
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      username: json['username'] as String?,
      image: json['image'] as String?,
      tier: json['tier'] as String?,
      status: json['status'] as String?,
      isModerator: json['isModerator'] as bool?,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : null,
      displayName: json['displayName'] as String?,
      filePreferences: json['filePreferences'] != null
          ? UserFilePreferences.fromJson(
              json['filePreferences'] as Map<String, dynamic>,
            )
          : null,
      banned: json['bannedAt'] != null ? true : false,
    );
  }

  /// Creates a user instance from a current user (me) JSON response.
  factory User.fromMeJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int? ?? 0, // Default to 0 for tests
      username: json['username'] as String?,
      image: json['image'] as String?,
      tier: json['tier'] as String?,
      status: json['status'] as String?,
    );
  }

  /// Converts this user to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      if (username != null) 'username': username,
      if (image != null) 'image': image,
      if (tier != null) 'tier': tier,
      if (status != null) 'status': status,
      if (isModerator != null) 'isModerator': isModerator,
      if (createdAt != null) 'createdAt': createdAt!.toIso8601String(),
      if (displayName != null) 'displayName': displayName,
      if (filePreferences != null) 'filePreferences': filePreferences!.toJson(),
      if (banned != null && banned!) 'banned': banned,
    };
  }
}

/// User's file format preferences.
class UserFilePreferences {
  /// Preferred image format.
  final String? imageFormat;

  /// Preferred archive format.
  final String? archiveFormat;

  /// Creates a new user file preferences instance.
  const UserFilePreferences({
    this.imageFormat,
    this.archiveFormat,
  });

  /// Creates a user file preferences instance from a JSON map.
  factory UserFilePreferences.fromJson(Map<String, dynamic> json) {
    return UserFilePreferences(
      imageFormat: json['imageFormat'] as String?,
      archiveFormat: json['archiveFormat'] as String?,
    );
  }

  /// Converts these user file preferences to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      if (imageFormat != null) 'imageFormat': imageFormat,
      if (archiveFormat != null) 'archiveFormat': archiveFormat,
    };
  }
}
