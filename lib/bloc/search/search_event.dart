part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchMovieFetched extends SearchEvent {
  final String keyword;

  const SearchMovieFetched({required this.keyword});

  @override
  List<Object> get props => [keyword];
}
