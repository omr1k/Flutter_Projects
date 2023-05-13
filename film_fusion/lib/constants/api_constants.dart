import 'dart:math';

class ApiConstants {
  static const String youTubeBaseUrl = "https://www.youtube.com/watch?v=";
  static const String apiBaseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "82a26c2041b0da4a13ece3bf5dbb90ff";
  static String allMoviesEndPoint =
      "/discover/movie?api_key=${apiKey}&language=en-US&year=${Random().nextInt(44) + 1980}";
  static const String posterImageBaseUrl =
      "https://image.tmdb.org/t/p/original";
  static String singleMovieInfoUrl(int movieID) {
    return "${apiBaseUrl}/movie/${movieID}?api_key=${apiKey}&append_to_response=videos";
  }
}
