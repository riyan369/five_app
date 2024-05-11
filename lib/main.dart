import 'package:flutter/material.dart';
import 'package:five_app/screens/home_screen.dart';
import 'package:five_app/screens/weather_screen.dart';
import 'package:five_app/screens/movie_screen.dart';
import 'package:five_app/screens/timezone_screen.dart';
import 'package:five_app/screens/news_screen.dart';
import 'package:five_app/screens/currency_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Five APIs App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/weather': (context) => WeatherScreen(),
        '/movie': (context) => MovieScreen(),
        '/timezone': (context) => TimeZoneScreen(),
        '/news': (context) => NewsScreen(),
        '/currency': (context) => CurrencyScreen(),
      },
    );
  }
}
