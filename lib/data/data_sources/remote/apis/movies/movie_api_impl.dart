import 'dart:async';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobx_example/core/dio/exception/exception_utils.dart';
import 'package:mobx_example/domain/entities/movie/movie_detail.dart';
import 'package:mobx_example/domain/entities/movie/movies_list.dart';
import 'package:mobx_example/domain/usecases/movies/get_movie_detail.dart';
import 'package:mobx_example/domain/usecases/movies/get_search_movies.dart';
import 'package:mobx_example/domain/usecases/movies/get_upcoming_movies.dart';
import 'package:mobx_example/utils/logs/log_utils.dart';

import '../../../../../core/dio/dio_client.dart';
import '../../constants/network_constants.dart';

import 'movie_api.dart';

class MovieApiImpl extends MovieApi {
  // dio instance
  final DioClient _dioClient;

  // injecting dio instance
  MovieApiImpl(this._dioClient);

  var apiKEY = dotenv.get('MOVIE_API_KEY');

  @override
  Future<MoviesList?> getUpComingMovies(UpComingMoviesParams params) async {
    final queryParams = {
      "language": params.language,
      "page": params.page,
    };

    try {
      final res = await _dioClient.dio.get(
        NetworkConstants.upComingMoviesUrl,
        queryParameters: queryParams,
      );
      LogUtils.logInfo(
          'MovieApiImpl', 'getUpComingMovies', res.data.toString());
      return MoviesList.fromJson(res.data);
    } on Object catch (error) {
      LogUtils.logError(
          'MovieApiImpl', 'getUpComingMovies', 'Catch Error', error);
      throw ExceptionUtils.handleException(error);
    }
  }

  @override
  Future<MovieDetail?> getMovieDetail(MovieDetailParams params) async {
    final queryParams = {
      "language": params.language,
    };

    try {
      final res = await _dioClient.dio.get(
        '${NetworkConstants.movieDetailUrl}/${params.movie_id}',
        queryParameters: queryParams,
      );
      LogUtils.logInfo('MovieApiImpl', 'getMovieDetail', res.data.toString());
      print(res);
      return MovieDetail.fromJson(res.data);
    } on Object catch (error) {
      LogUtils.logError('MovieApiImpl', 'getMovieDetail', 'Catch Error', error);
      throw ExceptionUtils.handleException(error);
    }
  }

  @override
  Future<MoviesList?> getSearchedMovies(SearchMoviesParams params) async {
    final queryParams = {
      "query": params.query,
      "language": params.language,
      "include_adult": false,
      "page": params.page
    };

    try {
      final res = await _dioClient.dio.get(
        NetworkConstants.searchMoviesUrl,
        queryParameters: queryParams,
      );
      LogUtils.logInfo(
          'MovieApiImpl', 'getSearchedMovies', res.data.toString());
      return MoviesList.fromJson(res.data);
    } on Object catch (error) {
      LogUtils.logError(
          'MovieApiImpl', 'getSearchedMovies', 'Catch Error', error);
      throw ExceptionUtils.handleException(error);
    }
  }
}
