// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:film_trek/models/movie_detail_response.dart';
import 'package:film_trek/models/movie_response.dart';

class MovieRepository {
  final String apiKey = "0aea0b954d982438448f15e5e31515e8";
  static String mainUrl = "https://api.themoviedb.org/3";
  final Dio _dio = Dio();
  var getMoviesByNameUrl = '$mainUrl/search/movie';
  var getPopularUrl = '$mainUrl/movie/popular';
  var getTopRatedUrl = '$mainUrl/movie/top_rated';
  var getPlayingUrl = '$mainUrl/movie/now_playing';
  var getUpcomingUrl = '$mainUrl/movie/upcoming';
  var getTrendingUrl = '$mainUrl/trending/movie/day';
  var movieUrl = "$mainUrl/movie";

  Future<MovieResponse> getMovies({required String url, int page = 1}) async {
    var params = {
      "api_key": apiKey,
      "language": "en-US",
      "page": page,
      "include_adult": false
    };
    try {
      Response response = await _dio.get(url, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieResponse.withError("$error");
    }
  }

  //! ToDo: blade%20runner
  Future<MovieResponse> getMoviesByName(
      {required String name, int page = 1}) async {
    String movie = "blade";
    var params = {
      "query": movie,
      "api_key": apiKey,
      "language": "en-US",
      "page": page,
      "include_adult": false
    };
    try {
      Response response =
          await _dio.get(getMoviesByNameUrl, queryParameters: params);
      print(response.realUri);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieResponse.withError("$error");
    }
  }

  Future<MovieResponse> getPopularMovies() => getMovies(url: getPopularUrl);

  Future<MovieResponse> getTopRatedMovies() => getMovies(url: getTopRatedUrl);

  Future<MovieResponse> getPlayingMovies() => getMovies(url: getPlayingUrl);

  Future<MovieResponse> getUpcomingMovies() => getMovies(url: getUpcomingUrl);

  Future<MovieResponse> getTrendingMovies() => getMovies(url: getTrendingUrl);

  Future<MovieDetailResponse> getMovieDetail(int id) async {
    var params = {"api_key": apiKey, "language": "en-US"};
    try {
      Response response =
          await _dio.get("$movieUrl/$id", queryParameters: params);
      return MovieDetailResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieDetailResponse.withError("$error");
    }
  }

  Future<MovieResponse> getSimilarMovies(int id) async {
    var params = {"api_key": apiKey, "language": "en-US"};
    try {
      Response response =
          await _dio.get("$movieUrl/$id/similar", queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieResponse.withError("$error");
    }
  }
}
