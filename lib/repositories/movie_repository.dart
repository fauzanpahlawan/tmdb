import 'package:tmdb/models/movie_cast.dart';
import 'package:tmdb/models/movie_credits.dart';
import 'package:tmdb/models/movie_genre.dart';
import 'package:tmdb/models/movie_genres.dart';
import 'package:tmdb/models/movie.dart';
import 'package:tmdb/models/result.dart';
import 'package:tmdb/providers/movie_provider.dart';

class MovieRepository {
  final MovieProvider movieProvider;

  MovieRepository({required this.movieProvider});

  Future<List<Movie>> fetchNowPlaying() async {
    final response = await movieProvider.fetchNowPlaying();
    final results = Results.fromJson(response.data);
    final List<Movie> movies =
        results.movies.map((e) => Movie.fromJson(e)).toList();
    return movies;
  }

  Future<List<Movie>> fetchPopular() async {
    final response = await movieProvider.fetchPopular();
    final results = Results.fromJson(response.data);
    final List<Movie> movies =
        results.movies.map((e) => Movie.fromJson(e)).toList();
    return movies;
  }

  Future<List<Movie>> fetchSearch({required String query}) async {
    final response = await movieProvider.fetchSearch(query: query);
    final results = Results.fromJson(response.data);
    final List<Movie> movies =
        results.movies.map((e) => Movie.fromJson(e)).toList();

    return movies;
  }

  Future<Map<int, String>> fetchGenre() async {
    final response = await movieProvider.fetchGenres();
    final genresList = MovieGenres.fromJson(response.data);
    final List<MovieGenre> genres =
        genresList.genres.map((e) => MovieGenre.fromJson(e)).toList();
    final Map<int, String> genresMap = {for (var e in genres) e.id: e.name};
    return genresMap;
  }

  Future<List<MovieCast>> fetchMovieCasts({required int movieId}) async {
    final response = await movieProvider.fetchCasts(movieId: movieId);
    final movieCredits = MovieCredits.fromJson(response.data);
    final movieCasts =
        movieCredits.casts.map((e) => MovieCast.fromJson(e)).toList();
    return movieCasts;
  }
}
