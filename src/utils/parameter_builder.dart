/// A utility class for building API query parameters.
class ParameterBuilder {
  /// The map of query parameters.
  final Map<String, dynamic> _params = {};

  /// Adds a parameter to the builder if its value is not null.
  ///
  /// [key] - The parameter key.
  /// [value] - The parameter value.
  /// Returns the builder instance for chaining.
  ParameterBuilder add(String key, dynamic value) {
    if (value != null) {
      _params[key] = value;
    }
    return this;
  }

  /// Adds a boolean parameter to the builder if its value is not null.
  ///
  /// [key] - The parameter key.
  /// [value] - The parameter value.
  /// Returns the builder instance for chaining.
  ParameterBuilder addBool(String key, bool? value) {
    if (value != null) {
      _params[key] = value.toString();
    }
    return this;
  }

  /// Adds an enum parameter to the builder if its value is not null.
  ///
  /// [key] - The parameter key.
  /// [value] - The enum value.
  /// [stringify] - Optional function to convert the enum to a string.
  ///   If not provided, the enum's `toString()` method will be used.
  /// Returns the builder instance for chaining.
  ParameterBuilder addEnum<T>(
    String key,
    T? value, [
    String Function(T)? stringify,
  ]) {
    if (value != null) {
      _params[key] = stringify != null ? stringify(value) : value.toString();
    }
    return this;
  }

  /// Adds a list parameter to the builder if the list is not null or empty.
  ///
  /// [key] - The parameter key.
  /// [values] - The list of values.
  /// [delimiter] - The delimiter to use when joining the values. Defaults to ','.
  /// Returns the builder instance for chaining.
  ParameterBuilder addList<T>(
    String key,
    List<T>? values, {
    String delimiter = ',',
  }) {
    if (values != null && values.isNotEmpty) {
      _params[key] = values.join(delimiter);
    }
    return this;
  }

  /// Adds all parameters from a map if they are not null.
  ///
  /// [params] - The map of parameters to add.
  /// Returns the builder instance for chaining.
  ParameterBuilder addAll(Map<String, dynamic> params) {
    params.forEach((key, value) {
      if (value != null) {
        _params[key] = value;
      }
    });
    return this;
  }

  /// Returns the built parameters as a map.
  Map<String, dynamic> build() {
    return Map<String, dynamic>.from(_params);
  }

  /// Returns the built parameters as a map with string values.
  ///
  /// This is useful for query parameters, which must have string values.
  Map<String, String> buildStringMap() {
    return _params.map((key, value) => MapEntry(key, value.toString()));
  }
}