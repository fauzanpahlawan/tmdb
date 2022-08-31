import 'package:equatable/equatable.dart';
import 'package:tmdb/models/movie_cast.dart';

class MovieCredits extends Equatable {
  final int id;
  final List<dynamic> casts;

  const MovieCredits({required this.id, required this.casts});

  factory MovieCredits.fromJson(Map<String, dynamic> json) => MovieCredits(
        id: json["id"] ?? 0,
        casts: json["cast"] ?? <MovieCast>[],
      );

  @override
  List<Object?> get props => [id, casts];
}
