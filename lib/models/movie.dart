import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final String backdropPath;
  final List<dynamic> genreIds;
  final int id;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final String title;
  final num voteAverage;
  final int voteCount;

  const Movie({
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        backdropPath: json['backdrop_path'] ?? "null",
        genreIds: json['genre_ids'] ?? <dynamic>[],
        id: json['id'] ?? 0,
        overview: json['overview'] ?? "null",
        posterPath: json['poster_path'] ?? "null",
        releaseDate: json['release_date'] ?? "null",
        title: json['title'] ?? "null",
        voteAverage: json['vote_average'] ?? 0,
        voteCount: json['vote_count'] ?? 0,
      );

  @override
  List<Object?> get props => [
        backdropPath,
        genreIds,
        id,
        overview,
        posterPath,
        releaseDate,
        title,
        voteAverage,
        voteCount,
      ];
}
