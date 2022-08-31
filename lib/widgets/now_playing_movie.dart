import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/bloc/now_playing/now_playing_bloc.dart';
import 'package:tmdb/utils/constants.dart';
import 'package:tmdb/widgets/flavour_widgets/failure_indicator.dart';
import 'package:tmdb/widgets/flavour_widgets/loading_indicator.dart';
import 'package:tmdb/widgets/flavour_widgets/such_empty_indicator.dart';
import 'package:tmdb/widgets/movie_card.dart';

class NowPlayingMovie extends StatelessWidget {
  const NowPlayingMovie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NowPlayingBloc, NowPlayingState>(
      builder: (context, state) {
        switch (state.status) {
          case NowPlayingStatus.initial:
            return const LoadingIndicator();
          case NowPlayingStatus.success:
            return SizedBox(
              height: 325,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: state.nowPlayingMovies.length,
                itemBuilder: (BuildContext context, int index) => MovieCard(
                  movie: state.nowPlayingMovies[index],
                  origin: originNowPlaying,
                ),
              ),
            );
          case NowPlayingStatus.failure:
            return const FailureIndicator();
          default:
        }
        return const SuchEmptyIndicator();
      },
    );
  }
}
