import 'dart:async';

import 'package:mobx_example/domain/entities/movie/movie_detail.dart';
import 'package:mobx_example/domain/entities/movie/movies_list.dart';
import 'package:mobx_example/domain/usecases/movies/get_movie_detail.dart';
import 'package:mobx_example/domain/usecases/movies/get_search_movies.dart';
import 'package:mobx_example/domain/usecases/movies/get_upcoming_movies.dart';

abstract class MovieApi {
  Future<MoviesList?> getUpComingMovies(UpComingMoviesParams params);

  Future<MovieDetail?> getMovieDetail(MovieDetailParams params);

  Future<MoviesList?> getSearchedMovies(SearchMoviesParams params);
}
