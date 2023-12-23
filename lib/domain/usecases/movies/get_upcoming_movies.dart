import 'package:mobx_example/core/usecase/usecase.dart';
import 'package:mobx_example/domain/entities/movie/upcoming_movies.dart';

import '../../repository_interfaces/movies/movies_repository.dart';

class GetUpComingMoviesUseCase
    implements UseCase<UpComingMovies?, UpComingMoviesParams> {
  final MoviesRepository _moviesRepository;

  GetUpComingMoviesUseCase(this._moviesRepository);

  @override
  Future<UpComingMovies?> call({required UpComingMoviesParams params}) async {
    return _moviesRepository.getUpcomingMovies(params);
  }
}

class UpComingMoviesParams {
  String language;
  int page;

  UpComingMoviesParams({required this.language, required this.page});
}
