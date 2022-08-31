part of 'cast_bloc.dart';

abstract class MovieCastEvent extends Equatable {
  const MovieCastEvent();

  @override
  List<Object> get props => [];
}

class MovieCastsFetched extends MovieCastEvent {
  final int movieId;

  const MovieCastsFetched(this.movieId);

  @override
  List<Object> get props => [movieId];
}
