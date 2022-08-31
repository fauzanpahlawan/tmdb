import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tmdb/repositories/movie_repository.dart';

part 'genre_event.dart';
part 'genre_state.dart';

class GenreBloc extends Bloc<GenreEvent, GenreState> {
  final MovieRepository movieRepository;
  GenreBloc({required this.movieRepository})
      : super(const GenreState(status: GenreStatus.initial)) {
    on<GenresFetched>(_onGenreFetched);
  }

  Future<void> _onGenreFetched(
      GenresFetched event, Emitter<GenreState> emit) async {
    try {
      emit(state.copyWith(status: GenreStatus.initial));
      final genre = await movieRepository.fetchGenre();
      return emit(state.copyWith(
        status: GenreStatus.success,
        genres: genre,
      ));
    } catch (e) {
      emit(state.copyWith(status: GenreStatus.failure));
    }
  }
}
