class Currency {
  final String currencyCode;
  final double exchangeRate;

  Currency({
    required this.currencyCode,
    required this.exchangeRate,
  });

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      currencyCode: json['code'] as String,
      exchangeRate: json['rate'] as double,
    );
  }
}
