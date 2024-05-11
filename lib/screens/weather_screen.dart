import 'package:flutter/material.dart';
import 'package:five_app/models/weather.dart'; // Import the Weather model
import 'package:five_app/services/weather_service.dart'; // Import the WeatherService

class WeatherScreen extends StatefulWidget {
  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late Future<Weather> _weather;

  @override
  void initState() {
    super.initState();
    final String apiKey = '0b7584933c017346554675c3a6a3aab6';
    final double latitude = 9.9942; // Latitude for Muvattupuzha
    final double longitude = 76.5732; // Longitude for Muvattupuzha
    _weather = WeatherService(apiKey: apiKey).getWeather(latitude, longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
      ),
      body: FutureBuilder<Weather?>(
        future: _weather,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // Display weather information if data is available
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'City: ${snapshot.data!.city}', // Add null check
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Temperature: ${snapshot.data!.temperature}°C', // Add null check
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Description: ${snapshot.data!.description}', // Add null check
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            // Display error message if data retrieval fails
            return Center(
              child: Text('Failed to fetch weather data'),
            );
          }
          // Display loading indicator while data is being fetched
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
