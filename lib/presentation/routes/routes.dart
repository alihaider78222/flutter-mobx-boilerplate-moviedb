import 'package:flutter/material.dart';
import 'package:mobx_example/presentation/screens/home/home.dart';
import 'package:mobx_example/presentation/screens/movie_detail/movie_detail_screen.dart';
import 'package:mobx_example/presentation/screens/settings/settings_screen.dart';
import 'package:mobx_example/presentation/screens/upcoming_movies/upcoming_movies_screen.dart';
import 'package:mobx_example/presentation/screens/search_movies/search_movies_screen.dart';
import 'package:mobx_example/presentation/screens/watch_trailer/watch_trailer.dart';

enum Routes {
  home("/home"),
  settings("/settings"),
  upcomingMovies("/upcomingMovies"),
  movieDetail("/movieDetail"),
  searchMovies("/searchMovies"),
  watchTrailer("/watchTrailer");

  final String route;
  const Routes(this.route);

  static final routes = <String, WidgetBuilder>{
    Routes.home.route: (BuildContext context) => MyHomePage(),
    Routes.settings.route: (BuildContext context) => SettingsScreen(),
    Routes.upcomingMovies.route: (BuildContext context) =>
        UpComingMoviesScreen(),
    Routes.movieDetail.route: (BuildContext context) => MovieDetailScreen(),
    Routes.searchMovies.route: (BuildContext context) => SearchMoviesScreen(),
    Routes.watchTrailer.route: (BuildContext context) => WatchTrailerScreen(),
  };
}
