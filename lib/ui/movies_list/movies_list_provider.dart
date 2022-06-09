import 'package:flutter/material.dart';
import 'package:flutter_movies_with_provider/data/repository/movies_repository.dart';
import 'package:flutter_movies_with_provider/model/MovieModel.dart';

class MoviesProvider extends ChangeNotifier {
  List<Result> movieModel = [];
  MoviesRepository _moviesRepository = MoviesRepository();

  MoviesProvider() {
    getMovies();
  }

  void getMovies() {
    print("getMovies inside provider");
    _moviesRepository.fetchMovies().then((value) {
      movieModel = value.results;
      notifyListeners();
    });
  }
}
