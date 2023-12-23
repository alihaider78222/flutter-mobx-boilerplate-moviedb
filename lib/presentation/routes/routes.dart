import 'package:flutter/material.dart';
import 'package:mobx_example/presentation/screens/home/home.dart';
import 'package:mobx_example/presentation/screens/movie_detail/movie_detail_screen.dart';
import 'package:mobx_example/presentation/screens/settings/settings_screen.dart';
import 'package:mobx_example/presentation/screens/upcoming_movies/upcoming_movies_screen.dart';

enum Routes {
  home("/home"),
  settings("/settings"),
  upcomingMovies("/upcomingMovies"),
  movieDetail("/movieDetail");

  final String route;
  const Routes(this.route);

  static final routes = <String, WidgetBuilder>{
    Routes.home.route: (BuildContext context) => MyHomePage(),
    Routes.settings.route: (BuildContext context) => SettingsScreen(),
    Routes.upcomingMovies.route: (BuildContext context) =>
        UpComingMoviesScreen(),
    Routes.movieDetail.route: (BuildContext context) => MovieDetailScreen(),
  };
}
