//has reference to data source
import 'package:flutter_movies_with_provider/data/services/movies_api_service.dart';
import 'package:flutter_movies_with_provider/model/MovieModel.dart';

class MoviesRepository{
  MovieService _movieService = MovieService();

  Future<MovieModel> fetchMovies(){
    print("fetchMovies inside MoviesRepository");
    return _movieService.fetchMovies();
  }
}