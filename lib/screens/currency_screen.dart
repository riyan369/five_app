import 'package:flutter/material.dart';
import 'package:five_app/models/currency.dart'; // Import the Currency model
import 'package:five_app/services/currency_service.dart'; // Import the CurrencyService

class CurrencyScreen extends StatefulWidget {
  @override
  _CurrencyScreenState createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  late Future<List<Currency>> _currencyList; // Adjusted to allow null value

  @override
  void initState() {
    super.initState();
    final String apiKey = '560b779d1e1bc97bfbd10f99'; // Provide your API key here
    final String baseCurrency = 'USD'; // Provide your base currency here
    _currencyList = CurrencyService(apiKey: apiKey, baseCurrency: baseCurrency).getCurrencyRates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Currency Exchange'),
      ),
      body: FutureBuilder<List<Currency>>(
        future: _currencyList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // Display currency exchange rates if data is available
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index].currencyCode),
                  subtitle: Text(snapshot.data![index].exchangeRate.toString()),
                  onTap: () {
                    // Add navigation or further action when a currency item is tapped
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            // Display error message if data retrieval fails
            return Center(
              child: Text('Failed to fetch currency exchange data'),
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
