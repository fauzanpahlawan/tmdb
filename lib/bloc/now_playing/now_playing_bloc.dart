import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tmdb/models/movie.dart';
import 'package:tmdb/repositories/movie_repository.dart';

part 'now_playing_event.dart';
part 'now_playing_state.dart';

class NowPlayingBloc extends Bloc<NowPlayingEvent, NowPlayingState> {
  final MovieRepository movieRepository;
  NowPlayingBloc({required this.movieRepository})
      : super(const NowPlayingState(status: NowPlayingStatus.initial)) {
    on<NowPlayingFetched>(_onNowPlayingFetched);
  }

  Future<void> _onNowPlayingFetched(
      NowPlayingFetched event, Emitter<NowPlayingState> emit) async {
    try {
      emit(state.copyWith(
          status: NowPlayingStatus.initial, nowPlayingMovies: <Movie>[]));
      final movies = await movieRepository.fetchNowPlaying();
      return emit(state.copyWith(
        status: NowPlayingStatus.success,
        nowPlayingMovies: movies,
      ));
    } catch (e) {
      emit(state.copyWith(status: NowPlayingStatus.failure));
    }
  }
}
