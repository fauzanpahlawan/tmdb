import 'package:equatable/equatable.dart';

class MovieCast extends Equatable {
  final int id;
  final String profilePath;
  final String name;
  final String character;

  const MovieCast(
      {required this.id,
      required this.profilePath,
      required this.name,
      required this.character});

  factory MovieCast.fromJson(Map<String, dynamic> json) => MovieCast(
        id: json["id"] ?? 0,
        profilePath: json["profile_path"] ?? "null",
        name: json["name"] ?? "null",
        character: json["character"] ?? "null",
      );
  @override
  List<Object?> get props => [id, name, profilePath, character];
}
