import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb/bloc/genre/genre_bloc.dart';
import 'package:tmdb/bloc/movie_cast/cast_bloc.dart';
import 'package:tmdb/bloc/now_playing/now_playing_bloc.dart';
import 'package:tmdb/bloc/popular/popular_bloc.dart';
import 'package:tmdb/bloc/search/search_bloc.dart';
import 'package:tmdb/models/navigation_arguments.dart';
import 'package:tmdb/providers/movie_provider.dart';
import 'package:tmdb/repositories/movie_repository.dart';
import 'package:tmdb/screens/home.dart';
import 'package:tmdb/screens/movie_detail.dart';
import 'package:tmdb/screens/movie_search.dart';

const String routeHome = '/';
const String routeMovieDetail = '/movie_detail';
const String routeMovieSearch = '/movie_search';

class AppRouter {
  late MovieProvider movieProvider;
  late MovieRepository movieRepository;
  late NowPlayingBloc nowPlayingBloc;
  late PopularBloc popularBloc;
  late SearchBloc searchBloc;
  late GenreBloc genreBloc;
  late MovieCastBloc movieCastBloc;

  AppRouter() {
    movieProvider = MovieProvider();
    movieRepository = MovieRepository(movieProvider: movieProvider);
    nowPlayingBloc = NowPlayingBloc(movieRepository: movieRepository);
    popularBloc = PopularBloc(movieRepository: movieRepository);
    searchBloc = SearchBloc(movieRepository: movieRepository);
    genreBloc = GenreBloc(movieRepository: movieRepository);
    movieCastBloc = MovieCastBloc(movieRepository: movieRepository);
  }

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case routeHome:
        return MaterialPageRoute(
          builder: (context) {
            return MultiBlocProvider(
              providers: [
                BlocProvider.value(
                  value: nowPlayingBloc..add(NowPlayingFetched()),
                ),
                BlocProvider.value(
                  value: popularBloc..add(PopularFetched()),
                ),
              ],
              child: const Home(),
            );
          },
        );
      case routeMovieDetail:
        final args = routeSettings.arguments;
        return MaterialPageRoute(builder: (context) {
          NavigationArguments navArgs = args as NavigationArguments;
          return MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: genreBloc..add(GenresFetched()),
              ),
              BlocProvider.value(
                value: movieCastBloc..add(MovieCastsFetched(navArgs.movie.id)),
              ),
            ],
            child: MovieDetail(
              movie: navArgs.movie,
              origin: navArgs.origin,
            ),
          );
        });
      case routeMovieSearch:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider.value(
            value: searchBloc,
            child: const MovieSearch(),
          );
        });
      default:
        return MaterialPageRoute(builder: (_) => const Home());
    }
  }
}
