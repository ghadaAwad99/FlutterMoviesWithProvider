import 'dart:convert';

import 'package:flutter_movies_with_provider/model/MovieModel.dart';
import 'package:http/http.dart' as http;

class MovieService{

  Future<MovieModel> fetchMovies() async{
    print("fetchMovies inside MovieService");
    final response = await http.get(Uri.parse("https://api.themoviedb.org/4/discover/movie?api_key=bdee2da50a6d74db54386e74ecb18c4f&sort_by=popularity.desc"));
    print("response movies: ${response.body}");
    if(response.statusCode == 200){
      return MovieModel.fromJson(json.decode(response.body));
    } else{
      throw("Couldn't fetch movies");
    }
  }

}