import 'dart:convert';

import 'package:civitai_api/civitai_api.dart';
import 'package:test/test.dart';

import 'mock_http_client.dart';

void main() {
  group('CivitaiApi', () {
    late MockHttpClient mockClient;
    late CivitaiApi api;

    setUp(() {
      mockClient = MockHttpClient();
      api = CivitaiApi(
        apiKey: 'test_api_key',
        httpClient: mockClient,
      );
    });

    test('GET requests are correctly handled', () async {
      // Prepare mock response
      final mockResponse = {
        'items': [],
        'metadata': {
          'currentPage': 1,
          'pageSize': 10,
          'nextCursor': null,
          'nextPage': null
        }
      };

      mockClient.enqueue(
        body: jsonEncode(mockResponse),
        statusCode: 200,
      );

      // Execute the request
      await api.models.getModels();

      // Verify request was made correctly
      final request = mockClient.capturedRequests.first;
      expect(request.method, 'GET');
      expect(request.url.path, '/api/v1/models');
    });

    test('API key authentication sends token in query params', () async {
      // Prepare mock response
      final mockResponse = {
        'items': [],
        'metadata': {
          'currentPage': 1,
          'pageSize': 10,
          'nextCursor': null,
          'nextPage': null
        }
      };

      mockClient.enqueue(
        body: jsonEncode(mockResponse),
        statusCode: 200,
      );

      // Create API client with API key authentication
      final apiKeyClient = CivitaiApi(
        authConfig: AuthConfig.apiKey('api_key_value'),
        httpClient: mockClient,
      );

      // Make request
      await apiKeyClient.models.getModels();

      // Verify authentication
      final request = mockClient.capturedRequests.first;
      expect(request.url.queryParameters['token'], 'api_key_value');
    });

    test('RetryPolicy configuration is correct', () {
      // Create a retry policy with custom config
      const retryPolicy = RetryPolicy(
        config: RetryConfig(maxRetries: 2),
      );

      // Test that the config is correct
      expect(retryPolicy.config.maxRetries, 2);

      // Verify that it can retry server errors
      expect(
          retryPolicy.config.retryableExceptions
              .contains(CivitaiServerException),
          true);

      // Verify that it won't retry client errors (not in the list)
      expect(
          retryPolicy.config.retryableExceptions
              .contains(CivitaiBadRequestException),
          false);
    });
  });
}
