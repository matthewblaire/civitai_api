import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:civitai_api/civitai_api.dart';

/// Mock HTTP client for testing.
class MockHttpClient extends http.BaseClient {
  /// Queue of responses to return.
  final List<http.Response> _responseQueue = [];

  /// Captured requests for verification.
  final List<http.Request> capturedRequests = [];

  /// Whether to throw a network error.
  bool throwNetworkError = false;

  /// Delay to simulate network latency.
  Duration? delayResponse;

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    capturedRequests.add(request as http.Request);

    if (throwNetworkError) {
      throw Exception('Network error');
    }

    if (delayResponse != null) {
      await Future.delayed(delayResponse!);
    }

    if (_responseQueue.isEmpty) {
      throw Exception('No more responses in the queue');
    }

    final response = _responseQueue.removeAt(0);

    return http.StreamedResponse(
      Stream.fromIterable([response.bodyBytes]),
      response.statusCode,
      headers: response.headers,
      contentLength: response.contentLength,
      isRedirect: response.isRedirect,
      persistentConnection: response.persistentConnection,
      reasonPhrase: response.reasonPhrase,
    );
  }

  /// Adds a response to the queue.
  void enqueue({
    required String body,
    int statusCode = 200,
    Map<String, String> headers = const {'content-type': 'application/json'},
  }) {
    _responseQueue.add(
      http.Response(
        body,
        statusCode,
        headers: headers,
      ),
    );
  }

  /// Adds an error response to the queue.
  void enqueueError({
    required int statusCode,
    required String body,
    Map<String, String> headers = const {'content-type': 'application/json'},
  }) {
    _responseQueue.add(
      http.Response(
        body,
        statusCode,
        headers: headers,
      ),
    );
  }

  /// Adds a JSON response to the queue.
  void enqueueJson({
    required Map<String, dynamic> body,
    int statusCode = 200,
    Map<String, String> headers = const {'content-type': 'application/json'},
  }) {
    enqueue(
      body: jsonEncode(body),
      statusCode: statusCode,
      headers: headers,
    );
  }

  /// Test method for GET requests.
  Future<Map<String, dynamic>> getTest(String path) async {
    final uri = Uri.parse('https://civitai.com$path');
    final response = await this.get(uri);
    if (response.body.isEmpty) {
      return {};
    }
    return jsonDecode(response.body) as Map<String, dynamic>;
  }

  /// Test method for POST requests.
  Future<Map<String, dynamic>> postTest(String path, Map<String, dynamic> body,
      [CivitaiApi? client]) async {
    final uri = Uri.parse('https://civitai.com$path');

    if (client != null) {
      // Simulate scope checking for API client
      client._checkScope(ApiScope.write);
    }

    final response = await this.post(
      uri,
      body: jsonEncode(body),
      headers: {'Content-Type': 'application/json'},
    );
    return jsonDecode(response.body) as Map<String, dynamic>;
  }

  /// Test method for PUT requests.
  Future<Map<String, dynamic>> putTest(
      String path, Map<String, dynamic> body) async {
    final uri = Uri.parse('https://civitai.com$path');
    final response = await this.put(
      uri,
      body: jsonEncode(body),
      headers: {'Content-Type': 'application/json'},
    );
    return jsonDecode(response.body) as Map<String, dynamic>;
  }

  /// Test method for DELETE requests.
  Future<Map<String, dynamic>> deleteTest(String path) async {
    final uri = Uri.parse('https://civitai.com$path');
    final response = await this.delete(uri);
    if (response.body.isEmpty) {
      return {};
    }
    return jsonDecode(response.body) as Map<String, dynamic>;
  }
}

// Extension to add scope checking for tests
extension _ApiClientExtension on CivitaiApi {
  void _checkScope(ApiScope requiredScope) {
    if (authConfig != null && !authConfig!.hasScope(requiredScope)) {
      throw CivitaiForbiddenException(
        'API key does not have the required scope: ${requiredScope.toString().split('.').last}',
      );
    }
  }
}
