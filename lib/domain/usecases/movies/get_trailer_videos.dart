import 'package:mobx_example/core/usecase/usecase.dart';
import 'package:mobx_example/domain/entities/movie/trailer_video.dart';

import '../../repository_interfaces/movies/movies_repository.dart';

class GetTrailerVideosUseCase
    implements UseCase<TrailerVideos?, TrailerVideosParams> {
  final MoviesRepository _moviesRepository;

  GetTrailerVideosUseCase(this._moviesRepository);

  @override
  Future<TrailerVideos?> call({required TrailerVideosParams params}) async {
    return _moviesRepository.getTrailerVideos(params);
  }
}

class TrailerVideosParams {
  String language;
  int movie_id;

  TrailerVideosParams({required this.language, required this.movie_id});
}
