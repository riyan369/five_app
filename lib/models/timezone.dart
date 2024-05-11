class Timezone {
  final String name;
  final String abbreviation;
  final String countryCode;

  Timezone({
    required this.name,
    required this.abbreviation,
    required this.countryCode,
  });

  factory Timezone.fromJson(Map<String, dynamic> json) {
    return Timezone(
      name: json['name'],
      abbreviation: json['abbreviation'],
      countryCode: json['countryCode'],
    );
  }
}
