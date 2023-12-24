// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MovieStore on _MovieStore, Store {
  late final _$moviesListAtom =
      Atom(name: '_MovieStore.moviesList', context: context);

  @override
  MoviesList? get moviesList {
    _$moviesListAtom.reportRead();
    return super.moviesList;
  }

  @override
  set moviesList(MoviesList? value) {
    _$moviesListAtom.reportWrite(value, super.moviesList, () {
      super.moviesList = value;
    });
  }

  late final _$movieDetailAtom =
      Atom(name: '_MovieStore.movieDetail', context: context);

  @override
  MovieDetail? get movieDetail {
    _$movieDetailAtom.reportRead();
    return super.movieDetail;
  }

  @override
  set movieDetail(MovieDetail? value) {
    _$movieDetailAtom.reportWrite(value, super.movieDetail, () {
      super.movieDetail = value;
    });
  }

  late final _$searchMoviesListAtom =
      Atom(name: '_MovieStore.searchMoviesList', context: context);

  @override
  MoviesList? get searchMoviesList {
    _$searchMoviesListAtom.reportRead();
    return super.searchMoviesList;
  }

  @override
  set searchMoviesList(MoviesList? value) {
    _$searchMoviesListAtom.reportWrite(value, super.searchMoviesList, () {
      super.searchMoviesList = value;
    });
  }

  late final _$trailerVideoAtom =
      Atom(name: '_MovieStore.trailerVideo', context: context);

  @override
  String? get trailerVideo {
    _$trailerVideoAtom.reportRead();
    return super.trailerVideo;
  }

  @override
  set trailerVideo(String? value) {
    _$trailerVideoAtom.reportWrite(value, super.trailerVideo, () {
      super.trailerVideo = value;
    });
  }

  late final _$getUpComingMoviesAsyncAction =
      AsyncAction('_MovieStore.getUpComingMovies', context: context);

  @override
  Future<dynamic> getUpComingMovies() {
    return _$getUpComingMoviesAsyncAction.run(() => super.getUpComingMovies());
  }

  late final _$getMovieDetailAsyncAction =
      AsyncAction('_MovieStore.getMovieDetail', context: context);

  @override
  Future<dynamic> getMovieDetail(int movieId) {
    return _$getMovieDetailAsyncAction.run(() => super.getMovieDetail(movieId));
  }

  late final _$getSearchMoviesAsyncAction =
      AsyncAction('_MovieStore.getSearchMovies', context: context);

  @override
  Future<dynamic> getSearchMovies(String query) {
    return _$getSearchMoviesAsyncAction.run(() => super.getSearchMovies(query));
  }

  late final _$getTrailerVideosAsyncAction =
      AsyncAction('_MovieStore.getTrailerVideos', context: context);

  @override
  Future<dynamic> getTrailerVideos(int movieId) {
    return _$getTrailerVideosAsyncAction
        .run(() => super.getTrailerVideos(movieId));
  }

  @override
  String toString() {
    return '''
moviesList: ${moviesList},
movieDetail: ${movieDetail},
searchMoviesList: ${searchMoviesList},
trailerVideo: ${trailerVideo}
    ''';
  }
}
