import 'package:mobx_example/core/usecase/usecase.dart';
import 'package:mobx_example/domain/entities/movie/movie_detail.dart';

import '../../repository_interfaces/movies/movies_repository.dart';

class GetMovieDetailUseCase
    implements UseCase<MovieDetail?, MovieDetailParams> {
  final MoviesRepository _moviesRepository;

  GetMovieDetailUseCase(this._moviesRepository);

  @override
  Future<MovieDetail?> call({required MovieDetailParams params}) async {
    return _moviesRepository.getMovieDetail(params);
  }
}

class MovieDetailParams {
  String language;
  int movie_id;

  MovieDetailParams({required this.language, required this.movie_id});
}
