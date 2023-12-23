import 'package:mobx_example/core/usecase/usecase.dart';
import 'package:mobx_example/domain/entities/movie/movies_list.dart';

import '../../repository_interfaces/movies/movies_repository.dart';

class GetSearchMoviesUseCase
    implements UseCase<MoviesList?, SearchMoviesParams> {
  final MoviesRepository _moviesRepository;

  GetSearchMoviesUseCase(this._moviesRepository);

  @override
  Future<MoviesList?> call({required SearchMoviesParams params}) async {
    return _moviesRepository.getSearchedMovies(params);
  }
}

class SearchMoviesParams {
  String language;
  String query;
  int page;

  SearchMoviesParams(
      {required this.language, required this.query, required this.page});
}
