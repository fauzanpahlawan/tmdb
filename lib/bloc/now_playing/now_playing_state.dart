part of 'now_playing_bloc.dart';

enum NowPlayingStatus { initial, success, failure }

class NowPlayingState extends Equatable {
  final NowPlayingStatus status;
  final List<Movie> nowPlayingMovies;

  const NowPlayingState({
    required this.status,
    this.nowPlayingMovies = const <Movie>[],
  });

  NowPlayingState copyWith({
    NowPlayingStatus? status,
    List<Movie>? nowPlayingMovies,
  }) {
    return NowPlayingState(
      status: status ?? this.status,
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
    );
  }

  @override
  String toString() {
    return ''' NowPlayingState {status: $status, nowPlayingMovies: ${nowPlayingMovies.length}} ''';
  }

  @override
  List<Object> get props => [status, nowPlayingMovies];
}
