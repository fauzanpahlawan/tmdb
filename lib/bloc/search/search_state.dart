part of 'search_bloc.dart';

enum SearchStatus { initial, success, notFound, failure }

class SearchState extends Equatable {
  final SearchStatus status;
  final List<Movie> searchedMovies;

  const SearchState({
    required this.status,
    this.searchedMovies = const <Movie>[],
  });

  SearchState copyWith({
    SearchStatus? status,
    List<Movie>? searchedMovies,
  }) {
    return SearchState(
      status: status ?? this.status,
      searchedMovies: searchedMovies ?? this.searchedMovies,
    );
  }

  @override
  List<Object> get props => [status, searchedMovies];
}
