import 'package:flutter/material.dart';
import 'package:five_app/screens/weather_screen.dart';
import 'package:five_app/screens/movie_screen.dart';
import 'package:five_app/screens/timezone_screen.dart';
import 'package:five_app/screens/news_screen.dart';
import 'package:five_app/screens/currency_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Weather'),
            leading: Icon(Icons.wb_sunny),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WeatherScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Movies'),
            leading: Icon(Icons.movie),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MovieScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Time Zone'),
            leading: Icon(Icons.access_time),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TimeZoneScreen()),
              );
            },
          ),
          ListTile(
            title: Text('News'),
            leading: Icon(Icons.article),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewsScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Currency Exchange'),
            leading: Icon(Icons.attach_money),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CurrencyScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
