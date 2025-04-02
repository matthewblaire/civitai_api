import '../../utils/pagination.dart';
import '../entities/user.dart';

/// Response for the users endpoint.
class GetUsersResponse extends PaginatedResponse<User> {
  /// Creates a new get users response.
  const GetUsersResponse({
    required super.items,
    required super.metadata,
  });

  /// Creates a get users response from a JSON map.
  factory GetUsersResponse.fromJson(Map<String, dynamic> json) {
    final items = (json['items'] as List<dynamic>)
        .map((e) => User.fromJson(e as Map<String, dynamic>))
        .toList();

    final metadata = json['metadata'] != null
        ? PaginationMetadata.fromJson(json['metadata'] as Map<String, dynamic>)
        : const PaginationMetadata();

    return GetUsersResponse(
      items: items,
      metadata: metadata,
    );
  }

  /// Converts this response to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      'items': items.map((item) => item.toJson()).toList(),
      'metadata': metadata.toJson(),
    };
  }
}

/// Response for the current user endpoint.
class GetCurrentUserResponse {
  /// The current user details.
  final User user;

  /// Creates a new get current user response.
  const GetCurrentUserResponse({
    required this.user,
  });

  /// Creates a get current user response from a JSON map.
  factory GetCurrentUserResponse.fromJson(Map<String, dynamic> json) {
    return GetCurrentUserResponse(
      user: User.fromMeJson(json),
    );
  }

  /// Converts this response to a JSON map.
  Map<String, dynamic> toJson() {
    return user.toJson();
  }
}
