import 'movie.dart';

class MoviesResponse {
  List<Movie> movies;
  MoviesResponse({
    required this.movies,
  });

  factory MoviesResponse.fromJson(Map<String, dynamic> json) {
    return MoviesResponse(
      movies: _deserializeMovies(json['results']),
    );
  }

  static List<Movie> _deserializeMovies(List<dynamic> moviesJson) {
    return moviesJson.map((movieJson) => Movie.fromJson(movieJson)).toList();
  }
}


