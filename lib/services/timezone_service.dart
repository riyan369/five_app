import 'dart:convert';
import 'package:http/http.dart' as http;

class TimeZoneService {
  final String baseUrl = 'https://worldtimeapi.org/api/timezone'; // Replace with the actual base URL of the time zone API

  Future<String> getTimeZone() async {
    final String url = 'https://worldtimeapi.org/api/ip'; // Endpoint to fetch timezone based on IP
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final String timeZone = data['timezone']; // Extract timezone from the response

      return timeZone;
    } else {
      throw Exception('Failed to fetch time zone data');
    }
  }
}
