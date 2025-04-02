import '../../utils/pagination.dart';

/// Parameters for retrieving a list of users.
class GetUsersParams extends PaginationParams {
  /// Filter by user IDs.
  final List<int>? ids;

  /// Filter by username.
  final String? username;

  /// Search query for users.
  final String? query;

  /// Creates parameters for retrieving a list of users.
  const GetUsersParams({
    super.limit,
    super.page,
    super.cursor,
    this.ids,
    this.username,
    this.query,
  });

  @override
  Map<String, dynamic> toQueryParameters() {
    final params = super.toQueryParameters();

    if (ids != null && ids!.isNotEmpty) {
      params['ids'] = ids!.map((id) => id.toString()).join(',');
    }

    if (username != null) params['username'] = username;
    if (query != null) params['query'] = query;

    return params;
  }
}

/// Parameters for retrieving the current user's profile.
class GetCurrentUserParams {
  /// Whether to include the user's email.
  final bool? includeEmail;

  /// Creates parameters for retrieving the current user's profile.
  const GetCurrentUserParams({
    this.includeEmail,
  });

  /// Converts these parameters to a map for use in query parameters.
  Map<String, dynamic> toQueryParameters() {
    final params = <String, dynamic>{};

    if (includeEmail != null) params['includeEmail'] = includeEmail.toString();

    return params;
  }
}

/// Parameters for retrieving a user by username.
class GetUserByUsernameParams {
  /// The username to look up.
  final String username;

  /// Creates parameters for retrieving a user by username.
  const GetUserByUsernameParams({
    required this.username,
  });

  /// Converts these parameters to a map for use in query parameters.
  Map<String, dynamic> toQueryParameters() {
    return <String, dynamic>{};
  }
}
