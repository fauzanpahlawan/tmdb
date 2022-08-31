import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tmdb/models/movie_cast.dart';
import 'package:tmdb/repositories/movie_repository.dart';

part 'cast_event.dart';
part 'cast_state.dart';

class MovieCastBloc extends Bloc<MovieCastEvent, MovieCastState> {
  final MovieRepository movieRepository;
  MovieCastBloc({required this.movieRepository})
      : super(const MovieCastState(status: MovieCastStatus.initial)) {
    on<MovieCastsFetched>(_onMovieCastFetched);
  }

  Future<void> _onMovieCastFetched(
      MovieCastsFetched event, Emitter<MovieCastState> emit) async {
    try {
      emit(state.copyWith(status: MovieCastStatus.initial));
      final movieCasts =
          await movieRepository.fetchMovieCasts(movieId: event.movieId);
      if (movieCasts.isNotEmpty) {
        return emit(state.copyWith(
            status: MovieCastStatus.success, movieCasts: movieCasts));
      }
    } catch (e) {
      emit(state.copyWith(status: MovieCastStatus.failure));
    }
  }
}
