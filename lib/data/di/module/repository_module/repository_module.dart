import 'dart:async';
import 'package:mobx_example/data/data_sources/remote/apis/movies/movie_api.dart';
import 'package:mobx_example/data/repository/movies/movies_repository_impl.dart';
import 'package:mobx_example/di/service_locator.dart';
import 'package:mobx_example/domain/repository_interfaces/movies/movies_repository.dart';

mixin RepositoryModule {
  static Future<void> configureRepositoryModuleInjection() async {
    // repository:--------------------------------------------------------------
    // getIt.registerSingleton<SettingsRepository>(SettingsRepositoryImpl(
    //   getIt<SettingsSharedPreferenceDataSource>(),
    // ));

    //  Movies Repository
    getIt.registerSingleton<MoviesRepository>(
      MoviesRepositoryImpl(
        getIt<MovieApi>(),
        // getIt<PostLocalDatasource>(),
        // getIt<SharedPreferences>()
      ),
    );
  }
}
