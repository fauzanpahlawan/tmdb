import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/bloc/popular/popular_bloc.dart';
import 'package:tmdb/utils/constants.dart';
import 'package:tmdb/widgets/flavour_widgets/failure_indicator.dart';
import 'package:tmdb/widgets/flavour_widgets/loading_indicator.dart';
import 'package:tmdb/widgets/flavour_widgets/such_empty_indicator.dart';
import 'package:tmdb/widgets/movie_card.dart';

class PopularMovie extends StatelessWidget {
  const PopularMovie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth <= 400) {
          return const PopularMovieBlocBuilder(gridCount: 2);
        } else if (constraints.maxWidth <= 600) {
          return const PopularMovieBlocBuilder(gridCount: 3);
        } else if (constraints.maxWidth <= 800) {
          return const PopularMovieBlocBuilder(gridCount: 4);
        } else if (constraints.maxWidth <= 1000) {
          return const PopularMovieBlocBuilder(gridCount: 5);
        } else if (constraints.maxWidth <= 1200) {
          return const PopularMovieBlocBuilder(gridCount: 6);
        } else if (constraints.maxWidth <= 1400) {
          return const PopularMovieBlocBuilder(gridCount: 7);
        } else if (constraints.maxWidth <= 1600) {
          return const PopularMovieBlocBuilder(gridCount: 8);
        } else if (constraints.maxWidth <= 1800) {
          return const PopularMovieBlocBuilder(gridCount: 9);
        } else {
          return const PopularMovieBlocBuilder(gridCount: 10);
        }
      },
    );
  }
}

class PopularMovieBlocBuilder extends StatelessWidget {
  const PopularMovieBlocBuilder({
    Key? key,
    required this.gridCount,
  }) : super(key: key);

  final int gridCount;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularBloc, PopularState>(
      builder: (context, state) {
        switch (state.status) {
          case PopularStatus.initial:
            return const LoadingIndicator();
          case PopularStatus.success:
            return GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: gridCount,
                mainAxisExtent: 325,
              ),
              itemCount: state.popularMovies.length,
              itemBuilder: ((context, index) => MovieCard(
                    movie: state.popularMovies[index],
                    origin: originPopular,
                  )),
            );
          case PopularStatus.failure:
            return const FailureIndicator();
          default:
        }
        return const SuchEmptyIndicator();
      },
    );
  }
}
