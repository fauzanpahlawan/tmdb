import 'package:equatable/equatable.dart';
import 'package:tmdb/models/movie.dart';

class NavigationArguments extends Equatable {
  final Movie movie;
  final String origin;

  const NavigationArguments({required this.movie, required this.origin});

  @override
  List<Object?> get props => [movie, origin];
}
