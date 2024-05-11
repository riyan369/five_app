class Weather {
  final String city;
  final double temperature;
  final String description;

  Weather({
    required this.city,
    required this.temperature,
    required this.description,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      city: json['name'] as String,
      temperature: (json['main']['temp'] as num).toDouble(),
      description: json['weather'][0]['description'] as String,
    );
  }
}
