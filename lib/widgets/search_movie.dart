import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/bloc/search/search_bloc.dart';
import 'package:tmdb/utils/constants.dart';
import 'package:tmdb/widgets/flavour_widgets/failure_indicator.dart';
import 'package:tmdb/widgets/flavour_widgets/not_found_indicator.dart';
import 'package:tmdb/widgets/flavour_widgets/start_search_indicator.dart';
import 'package:tmdb/widgets/flavour_widgets/such_empty_indicator.dart';
import 'package:tmdb/widgets/movie_card.dart';

class SearchMovie extends StatelessWidget {
  final int gridCount;
  const SearchMovie({Key? key, required this.gridCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        switch (state.status) {
          case SearchStatus.initial:
            return const StartSearchIndicator();
          case SearchStatus.success:
            return GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: gridCount,
                mainAxisExtent: 325,
              ),
              itemCount: state.searchedMovies.length,
              itemBuilder: ((context, index) => MovieCard(
                    movie: state.searchedMovies[index],
                    origin: originSearch,
                  )),
            );
          case SearchStatus.notFound:
            return const NotFoundIndicator();
          case SearchStatus.failure:
            return const FailureIndicator();
          default:
        }
        return const SuchEmptyIndicator();
      },
    );
  }
}
