import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:five_app/models/currency.dart'; // Import the Currency model

class CurrencyService {
  final String apiKey;
  final String baseCurrency;

  CurrencyService({required this.apiKey, required this.baseCurrency});

  Future<List<Currency>> getCurrencyRates() async {
    final url = 'https://v6.exchangerate-api.com/v6/560b779d1e1bc97bfbd10f99/latest/USD';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final Map<String, dynamic> rates = data['conversion_rates'];

      // Map rates to list of Currency objects
      return rates.entries.map((entry) => Currency(
        currencyCode: entry.key,
        exchangeRate: entry.value.toDouble(),
      )).toList();
    } else {
      throw Exception('Failed to load currency exchange data');
    }
  }
}
