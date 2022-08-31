import 'package:flutter/material.dart';
import 'package:tmdb/models/movie.dart';
import 'package:tmdb/widgets/movie_detail/movie_detail_mobile.dart';
import 'package:tmdb/widgets/movie_detail/movie_detail_web.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;
  final String origin;
  const MovieDetail({Key? key, required this.movie, required this.origin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie Detail"),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 700) {
            return MovieDetailMobile(
              movie: movie,
              origin: origin,
              maxWidth: constraints.maxWidth,
            );
            // return SizedBox();
          } else if (constraints.maxWidth <= 1000) {
            return MovieDetailWeb(
                movie: movie, origin: origin, maxWidth: constraints.maxWidth);
          } else {
            return MovieDetailWeb(movie: movie, origin: origin, maxWidth: 1000);
          }
        },
      ),
    );
  }
}
