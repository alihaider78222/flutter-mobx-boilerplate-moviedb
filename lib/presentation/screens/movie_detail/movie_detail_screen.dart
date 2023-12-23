import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mobx_example/di/service_locator.dart';
import 'package:mobx_example/domain/usecases/movies/get_movie_detail.dart';
import 'package:mobx_example/domain/usecases/movies/get_upcoming_movies.dart';
import 'package:mobx_example/generated/locale_keys.g.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({
    super.key,
  });
  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  int _counter = 0;

  var _getMovieDetailUseCase = getIt<GetMovieDetailUseCase>();

  @override
  void initState() {
    super.initState();

    var params = MovieDetailParams(
      language: 'en-US',
      movie_id: 572802,
    );
    _getMovieDetailUseCase.call(params: params).then((value) {
      print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // title: Text(context.tr('title')),
        title: Text("Movie Detail"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
