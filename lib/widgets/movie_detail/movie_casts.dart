import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/bloc/movie_cast/cast_bloc.dart';
import 'package:tmdb/utils/constants.dart';
import 'package:tmdb/widgets/flavour_widgets/loading_indicator.dart';
import 'package:tmdb/widgets/movie_detail/movie_cast_card.dart';

class MovieCasts extends StatelessWidget {
  const MovieCasts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        elevation: 5.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                movieCasts,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: fontRaleway,
                  fontSize: 26,
                ),
              ),
            ),
            BlocBuilder<MovieCastBloc, MovieCastState>(
              builder: (context, state) {
                switch (state.status) {
                  case MovieCastStatus.initial:
                    return const LoadingIndicator();
                  case MovieCastStatus.success:
                    return SizedBox(
                      height: 325,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: state.movieCasts.length,
                        itemBuilder: (BuildContext context, int index) {
                          return MovieCastCard(
                              movieCast: state.movieCasts[index]);
                        },
                      ),
                    );
                  case MovieCastStatus.failure:
                    return const SizedBox();
                  default:
                    return const SizedBox();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
