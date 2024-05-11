import 'package:flutter/material.dart';
import 'package:five_app/services/timezone_service.dart'; // Import the TimeZoneService

class TimeZoneScreen extends StatefulWidget {
  @override
  _TimeZoneScreenState createState() => _TimeZoneScreenState();
}

class _TimeZoneScreenState extends State<TimeZoneScreen> {
  late Future<String> _timeZone;

  @override
  void initState() {
    super.initState();
    _timeZone = TimeZoneService().getTimeZone();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Zone'),
      ),
      body: FutureBuilder<String>(
        future: _timeZone,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            return Center(
              child: Text(
                'Time Zone: ${snapshot.data}',
                style: TextStyle(fontSize: 18),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Failed to fetch time zone data'),
            );
          }
          return Center(
            child: Text('No data available'),
          );
        },
      ),
    );
  }
}