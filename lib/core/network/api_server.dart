import 'dart:async';
import 'dart:convert';

import 'package:gpk_app/core/utils/app_log.dart';
import 'package:http/http.dart' as http;

class ApiServer {
  final String baseUrl;
  final http.Client _client;
  ApiServer({required this.baseUrl, http.Client? client})
    : _client = client ?? http.Client();

  Future<dynamic> fetch(String path, {Map<String, String>? query}) async {
    final Uri uri = Uri.parse('$baseUrl$path').replace(
      queryParameters: query,
    );

    try {
      final response = await _client
          .get(
            uri,
            headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json',
            },
          )
          .timeout(const Duration(seconds: 30)); // Timeout after 30 seconds
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return json.decode(response.body);
      }
      throw ApiException(
        'server error (${response.statusCode} : ${response.body})',
      );
    } on http.ClientException catch (e) {
      throw ApiException('Network error: $e');
    } on TimeoutException {
      throw ApiException('Request Timed out');
    } on ApiException {
      rethrow;
    } catch (e) {
      Log.error("$e");
      throw ApiException('Unexpected error $e');
    }
  }
}

class ApiException implements Exception {
  final String message;
  ApiException(this.message);

  @override
  String toString() => 'ApiException($message)';
}
