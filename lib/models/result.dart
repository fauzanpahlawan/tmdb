import 'package:equatable/equatable.dart';

class Results extends Equatable {
  final List<dynamic> movies;

  const Results({required this.movies});

  factory Results.fromJson(Map<String, dynamic> json) =>
      Results(movies: json['results'] as List<dynamic>);

  @override
  List<Object?> get props => [movies];
}
