part of 'genre_bloc.dart';

enum GenreStatus { initial, success, failure }

class GenreState extends Equatable {
  final GenreStatus status;

  final Map<int, String> genres;

  const GenreState({
    required this.status,
    this.genres = const <int, String>{},
  });

  GenreState copyWith({
    GenreStatus? status,
    Map<int, String>? genres,
  }) {
    return GenreState(
      status: status ?? this.status,
      genres: genres ?? this.genres,
    );
  }

  @override
  String toString() {
    return ''' GenreState {status: $status, nowPlayingMovies: ${genres.length}} ''';
  }

  @override
  List<Object> get props => [status, genres];
}
