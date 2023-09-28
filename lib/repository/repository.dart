// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:film_trek/models/movie_detail_response.dart';
import 'package:film_trek/models/movie_response.dart';

class MovieRepository {
  final String apiKey = "0aea0b954d982438448f15e5e31515e8";
  static String mainUrl = "https://api.themoviedb.org/3";
  final Dio _dio = Dio();
  var getPopularUrl = '$mainUrl/movie/popular';
  var getTopRatedUrl = '$mainUrl/movie/top_rated';
  var getPlayingUrl = '$mainUrl/movie/now_playing';
  var getUpcomingUrl = '$mainUrl/movie/upcoming';
  var movieUrl = "$mainUrl/movie";

  Future<MovieResponse> getMovies(String url) async {
    var params = {"api_key": apiKey, "language": "en-US", "page": 1};
    try {
      Response response = await _dio.get(url, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieResponse.withError("$error");
    }
  }

  Future<MovieResponse> getPopularMovies() => getMovies(getPopularUrl);

  Future<MovieResponse> getTopRatedMovies() => getMovies(getTopRatedUrl);

  Future<MovieResponse> getPlayingMovies() => getMovies(getPlayingUrl);

  Future<MovieResponse> getUpcomingMovies() => getMovies(getUpcomingUrl);

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
