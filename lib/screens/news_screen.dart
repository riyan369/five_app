import 'package:flutter/material.dart';
import 'package:five_app/models/news.dart'; // Import the News model
import 'package:five_app/services/news_service.dart'; // Import the NewsService

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  late Future<List<News>> _newsList; // Adjusted to allow null value

  @override
  void initState() {
    super.initState();
    final String apiKey = '8660252ca37745598045a34a086e76e9'; // Provide your API key here
    _newsList = NewsService(apiKey: apiKey).getNews(); // Fetch news data when the screen initializes
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      body: FutureBuilder<List<News>>(
        future: _newsList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // Display news list if data is available
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index].title),
                  subtitle: Text(snapshot.data![index].description),
                  onTap: () {
                    // Add navigation or further action when a news item is tapped
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            // Display error message if data retrieval fails
            return Center(
              child: Text('Failed to fetch news data'),
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
