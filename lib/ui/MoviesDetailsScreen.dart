import 'package:flutter/material.dart';
import 'package:flutter_movies_with_provider/model/MovieModel.dart';
import 'package:intl/intl.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MoviesScreenDetails extends StatelessWidget {
  final Result movie;

  MoviesScreenDetails(this.movie);

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    String release = dateFormat
        .format(movie.releaseDate!); //Converting DateTime object to String
    return Scaffold(
        appBar: AppBar(
          title: Text(movie.title as String),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Hero(
                    tag: "${movie.title}",
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image(
                          image: NetworkImage(
                              "https://image.tmdb.org/t/p/w500/${movie.posterPath}")),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(8)),
                  RatingBarIndicator(
                      rating: (movie.voteAverage! / 2),
                      itemBuilder: (context, index) {
                        return const Icon(
                          Icons.star,
                          color: Colors.amber,
                        );
                      }),
                  const Padding(padding: EdgeInsets.all(10)),
                  Text(
                    "Realeased at: $release",
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 15.0,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(8)),
                  const Text(
                    "Description:",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(movie.overview as String),
                  ),
                ],
              )),
        ));
  }
}
