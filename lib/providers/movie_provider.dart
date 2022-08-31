import 'package:dio/dio.dart';

const String baseUrl = "https://api.themoviedb.org/3";

const String apiKey = "1115f1b9c9ed72b803b8cbbc051380b0";
const String language = "en-US";
const int page = 1;
const String nowPlayingMovie = "/movie/now_playing";
const String popularMovie = "/movie/popular";
const String searchMovie = "/search/movie";
const String movieGenre = "/genre/movie/list";
String movieCast({required int movieId}) => "/movie/$movieId/credits";

class MovieProvider {
  Future<Response> fetchNowPlaying() async {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        queryParameters: {
          'api_key': apiKey,
          'language': language,
          'page': page,
        },
        responseType: ResponseType.json,
      ),
    );
    final response = await dio.get(nowPlayingMovie);
    return response;
  }

  Future<Response> fetchPopular() async {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        queryParameters: {
          'api_key': apiKey,
          'language': language,
          'page': page,
        },
        responseType: ResponseType.json,
      ),
    );
    final response = await dio.get(popularMovie);
    return response;
  }

  Future<Response> fetchSearch({required String query}) async {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        queryParameters: {
          'api_key': apiKey,
          'language': language,
          'query': query,
          'page': page,
          'include_adult': false,
        },
        responseType: ResponseType.json,
      ),
    );
    final response = await dio.get(searchMovie);
    return response;
  }

  Future<Response> fetchGenres() async {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        queryParameters: {
          'api_key': apiKey,
          'language': language,
        },
        responseType: ResponseType.json,
      ),
    );
    final response = await dio.get(movieGenre);
    return response;
  }

  Future<Response> fetchCasts({required int movieId}) async {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        queryParameters: {
          'api_key': apiKey,
          'language': language,
        },
        responseType: ResponseType.json,
      ),
    );
    final response = await dio.get(movieCast(movieId: movieId));
    return response;
  }
}
