/// Response for the enums endpoint.
class GetEnumsResponse {
  /// Map of enum names to enum values.
  final Map<String, List<String>> enums;

  /// Creates a new get enums response.
  const GetEnumsResponse({
    required this.enums,
  });

  /// Creates a get enums response from a JSON map.
  factory GetEnumsResponse.fromJson(Map<String, dynamic> json) {
    final enums = json.map(
      (key, value) => MapEntry(
        key,
        (value as List<dynamic>).map((e) => e as String).toList(),
      ),
    );

    return GetEnumsResponse(
      enums: enums,
    );
  }

  /// Converts this response to a JSON map.
  Map<String, dynamic> toJson() {
    return enums;
  }
}
