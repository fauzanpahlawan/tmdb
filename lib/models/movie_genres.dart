import 'package:equatable/equatable.dart';

class MovieGenres extends Equatable {
  final List<dynamic> genres;

  const MovieGenres({required this.genres});

  factory MovieGenres.fromJson(Map<String, dynamic> json) => MovieGenres(
        genres: json["genres"] as List<dynamic>,
      );

  @override
  List<Object?> get props => [genres];
}
