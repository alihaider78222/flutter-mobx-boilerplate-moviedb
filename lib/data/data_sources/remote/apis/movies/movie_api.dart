import 'dart:async';

import 'package:mobx_example/domain/entities/movie/upcoming_movies.dart';
import 'package:mobx_example/domain/usecases/movies/get_upcoming_movies.dart';

abstract class MovieApi {
  Future<UpComingMovies?> getUpComingMovies(UpComingMoviesParams params);
}
