/// Response for the permissions check endpoint.
class CheckPermissionsResponse {
  /// Map of entity IDs to permission values.
  final Map<String, bool> permissions;

  /// Creates a new check permissions response.
  const CheckPermissionsResponse({
    required this.permissions,
  });

  /// Creates a check permissions response from a JSON map.
  factory CheckPermissionsResponse.fromJson(Map<String, dynamic> json) {
    final permissions = json.map((key, value) => MapEntry(key, value as bool));
    
    return CheckPermissionsResponse(
      permissions: permissions,
    );
  }

  /// Converts this response to a JSON map.
  Map<String, dynamic> toJson() {
    return permissions;
  }
}