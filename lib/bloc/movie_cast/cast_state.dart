part of 'cast_bloc.dart';

enum MovieCastStatus { initial, success, failure }

class MovieCastState extends Equatable {
  final MovieCastStatus status;
  final List<MovieCast> movieCasts;

  const MovieCastState({
    required this.status,
    this.movieCasts = const <MovieCast>[],
  });

  MovieCastState copyWith({
    MovieCastStatus? status,
    List<MovieCast>? movieCasts,
  }) {
    return MovieCastState(
      status: status ?? this.status,
      movieCasts: movieCasts ?? this.movieCasts,
    );
  }

  @override
  List<Object> get props => [status, movieCasts];
}
