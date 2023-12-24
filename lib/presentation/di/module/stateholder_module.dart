import 'dart:async';

import 'package:mobx_example/core/settings/settings_controller.dart';
import 'package:mobx_example/core/settings/settings_service.dart';
import 'package:mobx_example/di/service_locator.dart';
import 'package:mobx_example/domain/usecases/movies/get_movie_detail.dart';
import 'package:mobx_example/domain/usecases/movies/get_search_movies.dart';
import 'package:mobx_example/domain/usecases/movies/get_upcoming_movies.dart';
import 'package:mobx_example/presentation/stores/home_store.dart';
import 'package:mobx_example/presentation/stores/movie_store.dart';

mixin StateHolderModule {
  static Future<void> configureStateHolderModuleInjection() async {
    //
    // Settings (Theme, Font etc )
    //
    getIt.registerLazySingleton<SettingsController>(
      () => SettingsController(
        SettingsService(),
      ),
    );

    getIt.registerSingleton<HomeStore>(
      HomeStore(),
    );
    getIt.registerSingleton<MovieStore>(
      MovieStore(
        getIt<GetUpComingMoviesUseCase>(),
        getIt<GetMovieDetailUseCase>(),
        getIt<GetSearchMoviesUseCase>(),
      ),
    );
  }
}
