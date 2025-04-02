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
      params['ids'] = ids!.join(',');
    }
    
    if (username != null) params['username'] = username;
    if (query != null) params['query'] = query;
    
    return params;
  }
}