import 'package:film_fusion/utils/network_manger.dart';
import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieNotifier extends ChangeNotifier {
  List<Movie> movies = [];
  List<Movie> trendingNowMovies = [];
  List<Movie> dicoverMovies = [];
  List<Movie> faveMovies = [];

  void getAllMovies() async {
    print("NNNNNNNNNNNNN");
    print(movies.length);
    if (movies.length == 0) {
      List<Movie> fetchedMovies = await NetworkManager.fetchMovies();
      movies = List.from(fetchedMovies)..shuffle();
      trendingNowMovies = List.from(fetchedMovies)..reversed;
      dicoverMovies = List.from(fetchedMovies)..shuffle();
      notifyListeners();
    }
  }

  void addToFavList(Movie myMovie) {
    print("=====befor=====");
    print(faveMovies.length);
    if (faveMovies.contains(myMovie)) {
      faveMovies.remove(myMovie);
      movies[movies.indexOf(myMovie)].filpIsFave();
    } else {
      faveMovies.add(myMovie);
      movies[movies.indexOf(myMovie)].filpIsFave();
    }
    print("=====after=====");
    print(faveMovies.length);
    notifyListeners();
  }
}
