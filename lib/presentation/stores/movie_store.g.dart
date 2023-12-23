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

  late final _$getUpComingMoviesAsyncAction =
      AsyncAction('_MovieStore.getUpComingMovies', context: context);

  @override
  Future<dynamic> getUpComingMovies() {
    return _$getUpComingMoviesAsyncAction.run(() => super.getUpComingMovies());
  }

  @override
  String toString() {
    return '''
moviesList: ${moviesList}
    ''';
  }
}
