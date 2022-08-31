part of 'popular_bloc.dart';

enum PopularStatus { initial, success, failure }

class PopularState extends Equatable {
  final PopularStatus status;
  final List<Movie> popularMovies;

  const PopularState({
    required this.status,
    this.popularMovies = const <Movie>[],
  });

  PopularState copyWith({
    PopularStatus? status,
    List<Movie>? popularMovies,
  }) {
    return PopularState(
        status: status ?? this.status,
        popularMovies: popularMovies ?? this.popularMovies);
  }

  @override
  String toString() {
    return ''' Popular {status: $status, popularMovies: ${popularMovies.length}} ''';
  }

  @override
  List<Object> get props => [status, popularMovies];
}
