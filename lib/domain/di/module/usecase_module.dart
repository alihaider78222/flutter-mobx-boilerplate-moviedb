import 'dart:async';

import 'package:mobx_example/di/service_locator.dart';
import 'package:mobx_example/domain/repository_interfaces/movies/movies_repository.dart';
import 'package:mobx_example/domain/usecases/movies/get_movie_detail.dart';
import 'package:mobx_example/domain/usecases/movies/get_search_movies.dart';
import 'package:mobx_example/domain/usecases/movies/get_upcoming_movies.dart';

mixin UseCaseModule {
  static Future<void> configureUseCaseModuleInjection() async {
    // Movies :----------------------------------------------------------------

    // Upcoming Movies List usecase
    getIt.registerSingleton<GetUpComingMoviesUseCase>(
      GetUpComingMoviesUseCase(getIt<MoviesRepository>()),
    );

    // Movie Detail usecase
    getIt.registerSingleton<GetMovieDetailUseCase>(
      GetMovieDetailUseCase(getIt<MoviesRepository>()),
    );

    // Search movies list usecase
    getIt.registerSingleton<GetSearchMoviesUseCase>(
      GetSearchMoviesUseCase(getIt<MoviesRepository>()),
    );
  }
}
