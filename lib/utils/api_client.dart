import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {
  final String baseUrl;

  ApiClient({required this.baseUrl});

  Future<dynamic> getRequest(String endpoint, Map<String, dynamic> queryParams) async {
    final uri = Uri.parse('$baseUrl/$endpoint').replace(queryParameters: queryParams);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to make GET request: ${response.statusCode}');
    }
  }
}
