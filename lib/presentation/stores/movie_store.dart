import 'package:data_state_mobx/data_state.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_example/core/dio/exception/exception_utils.dart';
import 'package:mobx_example/domain/entities/movie/movies_list.dart';
import 'package:mobx_example/domain/usecases/movies/get_upcoming_movies.dart';

part 'movie_store.g.dart';

class MovieStore = _MovieStore with _$MovieStore;

abstract class _MovieStore with Store {
  // use cases instance
  final GetUpComingMoviesUseCase _getUpComingMoviesUseCase;

  // constructor:---------------------------------------------------------------
  _MovieStore(
    this._getUpComingMoviesUseCase,
  );

  final dataState = DataState<MoviesList?>();

  @observable
  MoviesList? moviesList;

  // actions:-------------------------------------------------------------------

  @action
  Future getUpComingMovies() async {
    dataState.setLoadingState();
    var params = UpComingMoviesParams(
      language: 'en-US',
      page: 1,
    );

    final future = _getUpComingMoviesUseCase.call(params: params);
    await future.then((value) async {
      if (value != null) {
        moviesList = value;
      }
      dataState.setSuccessState(moviesList);
    }).catchError((e) {
      print(e);
      var errorMessage = ExceptionUtils.getMessage(e);
      print('Catch Error $errorMessage');
      dataState.setErrorState(errorMessage);
    });
  }

  // general methods:-----------------------------------------------------------
  void dispose() {}
}
