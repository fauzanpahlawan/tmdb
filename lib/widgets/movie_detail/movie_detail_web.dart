import 'package:flutter/material.dart';
import 'package:tmdb/models/movie.dart';
import 'package:tmdb/utils/constants.dart';
import 'package:tmdb/widgets/movie_detail/movie_backdrop.dart';
import 'package:tmdb/widgets/movie_detail/movie_casts.dart';
import 'package:tmdb/widgets/movie_detail/movie_info.dart';
import 'package:tmdb/widgets/movie_detail/movie_overview.dart';

class MovieDetailWeb extends StatelessWidget {
  final Movie movie;
  final String origin;
  final double maxWidth;
  const MovieDetailWeb(
      {Key? key,
      required this.movie,
      required this.maxWidth,
      required this.origin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Align(
      child: SizedBox(
        width: maxWidth - 50,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(child: Center(child: _movie(size))),
            SliverToBoxAdapter(
                child: Center(child: MovieOverview(movie: movie))),
            const SliverToBoxAdapter(child: MovieCasts()),
          ],
        ),
      ),
    );
  }

  Stack _movie(Size size) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        MovieBackDrop(movie: movie),
        MovieInfo(
          movie: movie,
          origin: origin,
          maxWidth: maxWidth,
          screenType: screenTypeWeb,
        ),
      ],
    );
  }
}
