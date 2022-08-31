import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tmdb/models/movie.dart';
import 'package:tmdb/repositories/movie_repository.dart';

part 'popular_event.dart';
part 'popular_state.dart';

class PopularBloc extends Bloc<PopularEvent, PopularState> {
  final MovieRepository movieRepository;
  PopularBloc({required this.movieRepository})
      : super(const PopularState(status: PopularStatus.initial)) {
    on<PopularFetched>(_onPopularFetched);
  }

  Future<void> _onPopularFetched(
      PopularFetched event, Emitter<PopularState> emit) async {
    try {
      emit(state
          .copyWith(status: PopularStatus.initial, popularMovies: <Movie>[]));
      final movies = await movieRepository.fetchPopular();
      return emit(state.copyWith(
        status: PopularStatus.success,
        popularMovies: movies,
      ));
    } catch (e) {
      emit(state.copyWith(status: PopularStatus.failure));
    }
  }
}
