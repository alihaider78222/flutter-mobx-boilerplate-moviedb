import 'dart:async';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobx_example/core/dio/exception/exception_utils.dart';
import 'package:mobx_example/domain/entities/movie/movie_detail.dart';
import 'package:mobx_example/domain/entities/movie/upcoming_movies.dart';
import 'package:mobx_example/domain/usecases/movies/get_movie_detail.dart';
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
  Future<UpComingMovies?> getUpComingMovies(UpComingMoviesParams params) async {
    final queryParams = {
      "language": params.language,
      "page": params.page,
    };

    try {
      final res = await _dioClient.dio.get(
        NetworkConstants.upComingMoviesUrl,
        // data: jsonEncode(params),
        queryParameters: queryParams,
      );
      LogUtils.logInfo(
          'MovieApiImpl', 'getUpComingMovies', res.data.toString());
      return UpComingMovies.fromJson(res.data);
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
        // data: jsonEncode(params),
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
}
