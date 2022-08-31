import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/bloc/genre/genre_bloc.dart';
import 'package:tmdb/models/movie.dart';
import 'package:tmdb/utils/constants.dart';
import 'package:tmdb/utils/date_maker.dart';
import 'package:tmdb/widgets/flavour_widgets/loading_indicator.dart';
import 'package:tmdb/widgets/movie_detail/movie_add_to_watchlist_button.dart';
import 'package:tmdb/widgets/movie_detail/movie_favorite_button.dart';

class MovieInfo extends StatelessWidget {
  final Movie movie;
  final String origin;
  final double maxWidth;
  final String screenType;
  const MovieInfo(
      {Key? key,
      required this.movie,
      required this.maxWidth,
      required this.screenType,
      required this.origin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (screenType == screenTypeMobile) {
      return _movieInfoMobile(size);
    } else {
      return _movieInfoWeb(size);
    }
  }

  Container _movieInfoMobile(Size size) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Card(
        elevation: 5.0,
        child: Row(
          children: <Widget>[
            Expanded(flex: 3, child: _moviePoster()),
            Expanded(flex: 2, child: _movieMaindata(size)),
          ],
        ),
      ),
    );
  }

  Container _movieInfoWeb(Size size) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Card(
        color: Colors.black.withOpacity(0.5),
        elevation: 5.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Row(
              children: <Widget>[
                Align(
                    child: SizedBox(
                  height: maxWidth * 0.40,
                  child: _moviePoster(),
                )),
                Flexible(flex: 1, child: _movieMaindata(size)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ClipRRect _moviePoster() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(12.0),
        bottomLeft: Radius.circular(12.0),
      ),
      child: Hero(
        tag: moviePosterTag(movieId: movie.id, origin: origin),
        child: CachedNetworkImage(
          errorWidget: (context, url, error) =>
              Image.asset("assets/images/image_not_found.jpg"),
          placeholder: (context, url) => const Align(
            child: SizedBox(
              height: 150,
              width: 150,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          ),
          imageUrl: "$imageBaseUrl${movie.posterPath}",
        ),
      ),
    );
  }

  Container _movieMaindata(Size size) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            movie.title,
            style: const TextStyle(
              fontFamily: fontRaleway,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 20),
          const Text("Release date:"),
          Text(dateMaker(movie.releaseDate)),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                flex: 2,
                child: Icon(
                  Icons.star,
                  color: Colors.amber.shade800,
                ),
              ),
              Flexible(
                flex: 1,
                child: Text("${movie.voteAverage} / 10"),
              ),
            ],
          ),
          Text(
            "by ${movie.voteCount} reviews",
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          _movieGenre(),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Flexible(flex: 1, child: MovieFavoriteButton()),
              SizedBox(width: size.width * 0.05),
              const Flexible(flex: 1, child: MovieAddToWatchListButton()),
            ],
          ),
        ],
      ),
    );
  }

  BlocBuilder<GenreBloc, GenreState> _movieGenre() {
    return BlocBuilder<GenreBloc, GenreState>(
      builder: (context, state) {
        switch (state.status) {
          case GenreStatus.initial:
            return const LoadingIndicator();
          case GenreStatus.success:
            final List<int> genreIds =
                movie.genreIds.map((e) => e as int).toList();
            var genres = "";
            for (var e in genreIds) {
              genres += "${state.genres[e]}  ";
            }
            return Text(
              genres,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: fontRaleway,
              ),
            );
          case GenreStatus.failure:
            return const SizedBox();
          default:
            return const SizedBox();
        }
      },
    );
  }
}
