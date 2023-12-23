import 'dart:async';

import 'package:mobx_example/domain/usecases/movies/get_upcoming_movies.dart';

import '../../entities/movie/upcoming_movies.dart';

abstract class MoviesRepository {
  /// getUpcomingMovies
  ///
  /// Parameters:
  /// * [UpComingMoviesParams]
  ///
  /// Returns a [Future] containing a [Response] with a [UpComingMovies] as data
  /// Throws [DioException] if API call or serialization fails
  ///
  ///
  Future<UpComingMovies?> getUpcomingMovies(UpComingMoviesParams params);
}
