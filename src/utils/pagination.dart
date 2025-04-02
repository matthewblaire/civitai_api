/// Represents pagination metadata for API responses.
class PaginationMetadata {
  /// The current page number, if using page-based pagination.
  final int? currentPage;
  
  /// The size of each page, if using page-based pagination.
  final int? pageSize;
  
  /// The cursor for the next page, if using cursor-based pagination.
  final String? nextCursor;
  
  /// URL for the next page, if available.
  final String? nextPage;

  /// Creates a new pagination metadata instance.
  const PaginationMetadata({
    this.currentPage,
    this.pageSize,
    this.nextCursor,
    this.nextPage,
  });

  /// Creates a pagination metadata instance from a JSON map.
  factory PaginationMetadata.fromJson(Map<String, dynamic> json) {
    return PaginationMetadata(
      currentPage: json['currentPage'] as int?,
      pageSize: json['pageSize'] as int?,
      nextCursor: json['nextCursor']?.toString(),
      nextPage: json['nextPage'] as String?,
    );
  }

  /// Converts this pagination metadata to a JSON map.
  Map<String, dynamic> toJson() {
    return {
      if (currentPage != null) 'currentPage': currentPage,
      if (pageSize != null) 'pageSize': pageSize,
      if (nextCursor != null) 'nextCursor': nextCursor,
      if (nextPage != null) 'nextPage': nextPage,
    };
  }

  /// Returns true if there are more pages available.
  bool get hasMore => nextCursor != null || nextPage != null;

  @override
  String toString() {
    return 'PaginationMetadata('
        'currentPage: $currentPage, '
        'pageSize: $pageSize, '
        'nextCursor: $nextCursor, '
        'nextPage: $nextPage)';
  }
}

/// A paginated response containing items and pagination metadata.
class PaginatedResponse<T> {
  /// The list of items in the current page.
  final List<T> items;
  
  /// Metadata about the pagination state.
  final PaginationMetadata metadata;

  /// Creates a new paginated response.
  const PaginatedResponse({
    required this.items,
    required this.metadata,
  });

  /// Returns true if there are more pages available.
  bool get hasMore => metadata.hasMore;

  @override
  String toString() {
    return 'PaginatedResponse('
        'items: ${items.length} items, '
        'metadata: $metadata)';
  }
}

/// Base class for paginated request parameters.
class PaginationParams {
  /// Maximum number of items to return per page.
  final int? limit;
  
  /// Page number to return, if using page-based pagination.
  final int? page;
  
  /// Cursor for the next page, if using cursor-based pagination.
  final String? cursor;

  /// Creates parameters for a paginated request.
  const PaginationParams({
    this.limit,
    this.page,
    this.cursor,
  });

  /// Converts these parameters to a map for use in query parameters.
  Map<String, dynamic> toQueryParameters() {
    return {
      if (limit != null) 'limit': limit,
      if (page != null) 'page': page,
      if (cursor != null) 'cursor': cursor,
    };
  }
}