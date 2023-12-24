import 'package:data_state_mobx/data_state.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_example/core/dio/exception/exception_utils.dart';
import 'package:mobx_example/domain/entities/movie/movie_detail.dart';
import 'package:mobx_example/domain/entities/movie/movies_list.dart';
import 'package:mobx_example/domain/usecases/movies/get_movie_detail.dart';
import 'package:mobx_example/domain/usecases/movies/get_search_movies.dart';
import 'package:mobx_example/domain/usecases/movies/get_upcoming_movies.dart';

part 'movie_store.g.dart';

class MovieStore = _MovieStore with _$MovieStore;

abstract class _MovieStore with Store {
  // use cases instance
  final GetUpComingMoviesUseCase _getUpComingMoviesUseCase;
  final GetMovieDetailUseCase _getMovieDetailUseCase;
  final GetSearchMoviesUseCase _getSearchMoviesUseCase;

  // constructor:---------------------------------------------------------------
  _MovieStore(
    this._getUpComingMoviesUseCase,
    this._getMovieDetailUseCase,
    this._getSearchMoviesUseCase,
  ) {
    // converting Genre to Map for optimization
    // ignore: prefer_for_elements_to_map_fromiterable
    genresMap = Map.fromIterable(
      genresIds,
      key: (v) => v['id'].toString(),
      value: (v) => v['name'],
    );
  }

  Map<String, dynamic> genresMap = Map();

  // UpComing Movies : ---------------------------------------------------------
  final dataState = DataState<MoviesList?>();

  @observable
  MoviesList? moviesList;

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

  // Movie Detail : ---------------------------------------------------------
  final dataStateMovieDetail = DataState<MovieDetail?>();

  @observable
  MovieDetail? movieDetail;

  @action
  Future getMovieDetail(int movieId) async {
    dataStateMovieDetail.setLoadingState();

    var params = MovieDetailParams(
      language: 'en-US',
      movie_id: movieId,
    );

    final future = _getMovieDetailUseCase.call(params: params);
    await future.then((value) async {
      if (value != null) {
        movieDetail = value;
      }
      dataStateMovieDetail.setSuccessState(movieDetail);
    }).catchError((e) {
      print(e);
      var errorMessage = ExceptionUtils.getMessage(e);
      print('Catch Error $errorMessage');
      dataStateMovieDetail.setErrorState(errorMessage);
    });
  }

  // Search Movie List : ---------------------------------------------------------
  final dataStateSearchMovies = DataState<MoviesList?>();

  @observable
  MoviesList? searchMoviesList;

  @action
  Future getSearchMovies(String query) async {
    dataStateSearchMovies.setLoadingState();
    var params = SearchMoviesParams(
      language: 'en-US',
      query: query,
      page: 1,
    );

    final future = _getSearchMoviesUseCase.call(params: params);
    await future.then((value) async {
      if (value != null) {
        searchMoviesList = value;
      }
      dataStateSearchMovies.setSuccessState(searchMoviesList);
    }).catchError((e) {
      print(e);
      var errorMessage = ExceptionUtils.getMessage(e);
      print('Catch Error $errorMessage');
      dataStateSearchMovies.setErrorState(errorMessage);
    });
  }

  clearSearchMoviesList() {
    dataStateSearchMovies.setSuccessState(null);
    searchMoviesList = null;
  }

  //
  //  Genre ids
  //
  //  Get from https://developer.themoviedb.org/reference/genre-movie-list
  //
  var genresIds = [
    {"id": 28, "name": "Action"},
    {"id": 12, "name": "Adventure"},
    {"id": 16, "name": "Animation"},
    {"id": 35, "name": "Comedy"},
    {"id": 80, "name": "Crime"},
    {"id": 99, "name": "Documentary"},
    {"id": 18, "name": "Drama"},
    {"id": 10751, "name": "Family"},
    {"id": 14, "name": "Fantasy"},
    {"id": 36, "name": "History"},
    {"id": 27, "name": "Horror"},
    {"id": 10402, "name": "Music"},
    {"id": 9648, "name": "Mystery"},
    {"id": 10749, "name": "Romance"},
    {"id": 878, "name": "Science Fiction"},
    {"id": 10770, "name": "TV Movie"},
    {"id": 53, "name": "Thriller"},
    {"id": 10752, "name": "War"},
    {"id": 37, "name": "Western"}
  ];

  // general methods:-----------------------------------------------------------
  void dispose() {}
}
