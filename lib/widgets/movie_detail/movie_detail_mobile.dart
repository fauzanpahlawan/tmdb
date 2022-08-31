import 'package:flutter/material.dart';
import 'package:tmdb/models/movie.dart';
import 'package:tmdb/utils/constants.dart';
import 'package:tmdb/widgets/movie_detail/movie_backdrop.dart';
import 'package:tmdb/widgets/movie_detail/movie_casts.dart';
import 'package:tmdb/widgets/movie_detail/movie_info.dart';
import 'package:tmdb/widgets/movie_detail/movie_overview.dart';

class MovieDetailMobile extends StatelessWidget {
  final Movie movie;
  final String origin;
  final double maxWidth;
  const MovieDetailMobile(
      {Key? key,
      required this.movie,
      required this.maxWidth,
      required this.origin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(child: MovieBackDrop(movie: movie)),
        SliverToBoxAdapter(
            child: MovieInfo(
          movie: movie,
          origin: origin,
          maxWidth: maxWidth,
          screenType: screenTypeMobile,
        )),
        SliverToBoxAdapter(child: MovieOverview(movie: movie)),
        const SliverToBoxAdapter(child: MovieCasts()),
      ],
    );
  }
}
