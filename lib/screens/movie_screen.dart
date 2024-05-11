import 'package:flutter/material.dart';
import 'package:five_app/models/movie.dart'; // Import the Movie model
import 'package:five_app/services/movie_service.dart'; // Import the MovieService

class MovieScreen extends StatefulWidget {
  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  late Future<List<Movie>> _movieList; // Adjusted to allow null value

  @override
  void initState() {
    super.initState();
    final String apiKey = 'e95034ada94982bc5ca990bae2c68560'; // Replace with your API key
    _movieList = MovieService(apiKey: apiKey).getTopRatedMovies(); // Fetch top-rated movie data when the screen initializes
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
      ),
      body: FutureBuilder<List<Movie>>(
        future: _movieList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // Display movie list if data is available
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index].title),
                  subtitle: Text(snapshot.data![index].overview),
                  onTap: () {
                    // Add navigation or further action when a movie item is tapped
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            // Display error message if data retrieval fails
            return Center(
              child: Text('Failed to fetch movie data'),
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
