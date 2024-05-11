import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:five_app/models/movie.dart'; // Import the Movie model

class MovieService {
  final String apiKey;
  final String baseUrl = 'https://api.themoviedb.org/3'; // Base URL for The Movie Database API

  MovieService({required this.apiKey});

  Future<List<Movie>> getTopRatedMovies() async {
    final String url = '$baseUrl/movie/top_rated?api_key=e95034ada94982bc5ca990bae2c68560'; // Adjusted URL to fetch top-rated movies
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List<dynamic> results = data['results'];

      // Map results to list of Movie objects
      return results.map((result) => Movie.fromJson(result)).toList().cast<Movie>();
    } else {
      throw Exception('Failed to load top rated movies');
    }
  }
}
