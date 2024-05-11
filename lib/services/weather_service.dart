import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:five_app/models/weather.dart';

class WeatherService {
  final String apiKey;
  final String baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  WeatherService({required this.apiKey});

  Future<Weather> getWeather(double latitude, double longitude) async {
    final String url = '$baseUrl?lat=$latitude&lon=$longitude&appid=$apiKey';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = jsonDecode(response.body);
      return Weather.fromJson(jsonData);
    } else {
      throw Exception('Failed to fetch weather data');
    }
  }
}

