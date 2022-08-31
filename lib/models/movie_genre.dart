import 'package:equatable/equatable.dart';

class MovieGenre extends Equatable {
  final int id;
  final String name;

  const MovieGenre({required this.id, required this.name});

  factory MovieGenre.fromJson(Map<String, dynamic> json) => MovieGenre(
        id: json['id'] ?? 0,
        name: json['name'] ?? 'null',
      );

  @override
  List<Object?> get props => [id, name];
}
