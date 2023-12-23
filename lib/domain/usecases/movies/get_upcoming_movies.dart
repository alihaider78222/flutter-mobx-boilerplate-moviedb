import 'package:mobx_example/core/usecase/usecase.dart';
import 'package:mobx_example/domain/entities/movie/movies_list.dart';

import '../../repository_interfaces/movies/movies_repository.dart';

class GetUpComingMoviesUseCase
    implements UseCase<MoviesList?, UpComingMoviesParams> {
  final MoviesRepository _moviesRepository;

  GetUpComingMoviesUseCase(this._moviesRepository);

  @override
  Future<MoviesList?> call({required UpComingMoviesParams params}) async {
    return _moviesRepository.getUpcomingMovies(params);
  }
}

class UpComingMoviesParams {
  String language;
  int page;

  UpComingMoviesParams({required this.language, required this.page});
}
