import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:five_app/models/news.dart'; // Import the News model

class NewsService {
  final String apiKey;
  final String baseUrl = 'https://newsapi.org/v2'; // Replace 'YOUR_BASE_URL' with the actual base URL of the news API

  NewsService({required this.apiKey});

  Future<List<News>> getNews() async {
    final String url = 'https://newsapi.org/v2?apiKey=8660252ca37745598045a34a086e76e9'; // Adjust the endpoint and query parameters as per the API documentation
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List<dynamic> articles = data['articles'];

      // Map articles to list of News objects
      return articles.map((article) => News.fromJson(article)).toList().cast<News>();
    } else {
      throw Exception('Failed to load news data');
    }
  }
}
