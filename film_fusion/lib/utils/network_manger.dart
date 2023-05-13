import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/api_constants.dart';
import '../models/movie.dart';
import '../models/movies.dart';

class NetworkManager {
  static Future<List<Movie>> fetchMovies() async {
    try {
      final url = ApiConstants.apiBaseUrl + ApiConstants.allMoviesEndPoint;
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final decodedResponse = json.decode(response.body);
        final moviesResponse = MoviesResponse.fromJson(decodedResponse);
        return moviesResponse.movies;
      } else {
        throw Exception('Failed to fetch movies: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching movies: $e');
      rethrow;
    }
  }

  static Future<String> getMovieTrilerUrl(int movieID) async {
    try {
      final url = ApiConstants.singleMovieInfoUrl(movieID);
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonMap = json.decode(response.body);
        final results = jsonMap['videos']['results'];
        if (results.isNotEmpty) {
          print(ApiConstants.youTubeBaseUrl + results[0]['key']);
          // return ApiConstants.youTubeBaseUrl + results[0]['key'];
          return  results[0]['key'];
        }
      }
      // if no triler video available returen placeholder video
      return 'https://www.youtube.com/watch?v=eEzD-Y97ges';
    } catch (e) {
      print('Error fetching movies: $e');
      rethrow;
    }
  }
}
