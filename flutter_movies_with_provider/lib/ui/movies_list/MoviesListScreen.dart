import 'package:flutter/material.dart';
import 'package:flutter_movies_with_provider/model/MovieModel.dart';
import 'package:flutter_movies_with_provider/ui/MoviesDetailsScreen.dart';
import 'package:flutter_movies_with_provider/ui/movies_list/movies_list_provider.dart';
import 'package:provider/provider.dart';

class MoviesListScreen extends StatelessWidget {
  const MoviesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("build MoviesListScreen");
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter Movies"),
        ),
        body: ChangeNotifierProvider<MoviesProvider>(
          create: (context) => MoviesProvider(),
          child: Consumer<MoviesProvider>(
            builder: (buildContext, moviesProvider, _) {
              print("build Consumer");
              print("length is ${moviesProvider.movieModel.length}");
              return ListView.builder(
                  itemCount: moviesProvider.movieModel.length,
                  itemBuilder: (context, index) {
                    print("length is ${moviesProvider.movieModel.length}");
                    return MoviesListWidget(
                      movie: moviesProvider.movieModel[index],
                    );
                  });
              // Center(child: CircularProgressIndicator(),);
            },
          ),
        ));
  }
}

class MoviesListWidget extends StatelessWidget {
  const MoviesListWidget({Key? key, required this.movie}) : super(key: key);

  final Result movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: GestureDetector(
        child: Card(
          elevation: 6.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),

          child: Row(
            children: [
              Hero(
                tag: "${movie.title}",
                child: Container(
                  width: 120,
                  height: 120,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://image.tmdb.org/t/p/w500/${movie.posterPath}"),
                      fit: BoxFit.fitWidth,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Flexible(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          movie.title as String,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          softWrap: false,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0),
                          //TextStyle(fontWeight: FontWeight.bold)
                        ),
                      ),
                      Text(
                        movie.overview as String,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        softWrap: false,
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ]),
              ),
            ],
          ),

          //trailing: const Icon(Icons.favorite_border_outlined),
          //subtitle: Text(
          //   movie.overview as String,
          //  maxLines: 3,
          //  overflow: TextOverflow.ellipsis,
          // ),
        ),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => MoviesScreenDetails(movie)));
        },
      ),
    );
  }
}
