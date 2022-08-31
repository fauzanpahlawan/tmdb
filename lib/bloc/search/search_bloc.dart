import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tmdb/models/movie.dart';
import 'package:tmdb/repositories/movie_repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final MovieRepository movieRepository;
  SearchBloc({required this.movieRepository})
      : super(const SearchState(status: SearchStatus.initial)) {
    on<SearchMovieFetched>(_onSearchMovie);
  }

  Future<void> _onSearchMovie(
    SearchMovieFetched event,
    Emitter<SearchState> emit,
  ) async {
    try {
      final movies = await movieRepository.fetchSearch(query: event.keyword);
      if (movies.isNotEmpty) {
        return emit(state.copyWith(
          status: SearchStatus.success,
          searchedMovies: movies,
        ));
      } else {
        return emit(state.copyWith(
          status: SearchStatus.notFound,
          searchedMovies: movies,
        ));
      }
    } catch (e) {
      emit(state.copyWith(status: SearchStatus.failure));
    }
  }
}
