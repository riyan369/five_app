class Movie {
  final String title;
  final String overview;

  Movie({
    required this.title,
    required this.overview,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'] as String,
      overview: json['overview'] as String,
    );
  }
}
