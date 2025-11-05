import 'dart:convert';
import 'package:http/http.dart' as http;

class THttpHelper {
  // Basis-URL deiner API (hier als Platzhalter)
  static const String _baseUrl = 'https://your-api-base-url.com';

  // Einfacher GET-Request: /<endpoint>
  static Future<Map<String, dynamic>> get(String endpoint) async {
    final response = await http.get(Uri.parse('$_baseUrl/$endpoint'));
    return _handleResponse(response);
  }

  // Einfacher POST-Request mit JSON-Body
  static Future<Map<String, dynamic>> post(String endpoint, dynamic data) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: {'Content-Type': 'application/json' },
      body: json.encode(data), // serialisiert den Body als JSON
    );
    return _handleResponse(response);
  }

  // Einfacher PUT-Request mit JSON-Body
  static Future<Map<String, dynamic>> put(String endpoint, dynamic data) async {
    final response = await http.put(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: { 'Content-Type': 'application/json' },
      body: json.encode(data),
    );
    return _handleResponse(response);
  }

  // Einfacher DELETE-Request
  static Future<Map<String, dynamic>> delete(String endpoint) async {
    final response = await http.delete(Uri.parse('$_baseUrl/$endpoint'));
    return _handleResponse(response);
  }

  // Zentrale Response-Behandlung:
  // - Bei HTTP 200: Body als JSON decodieren und zurückgeben
  // - Sonst: Exception mit Statuscode werfen
  static Map<String, dynamic> _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}
