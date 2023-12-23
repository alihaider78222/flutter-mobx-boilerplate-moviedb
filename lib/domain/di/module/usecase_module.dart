import 'dart:async';

import 'package:mobx_example/di/service_locator.dart';
import 'package:mobx_example/domain/repository_interfaces/movies/movies_repository.dart';
import 'package:mobx_example/domain/usecases/movies/get_upcoming_movies.dart';

mixin UseCaseModule {
  static Future<void> configureUseCaseModuleInjection() async {
    // Movies :----------------------------------------------------------------
    getIt.registerSingleton<GetUpComingMoviesUseCase>(
      GetUpComingMoviesUseCase(getIt<MoviesRepository>()),
    );
  }
}
