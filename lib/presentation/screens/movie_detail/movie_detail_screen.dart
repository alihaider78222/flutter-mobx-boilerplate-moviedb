import 'package:flutter/material.dart';
import 'package:mobx_example/core/models/screen_args.dart';
import 'package:mobx_example/di/service_locator.dart';
import 'package:mobx_example/domain/usecases/movies/get_movie_detail.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({
    super.key,
  });
  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  ScreenArguments<int>? args;

  int? movieId;

  @override
  void initState() {
    super.initState();

    // var params = MovieDetailParams(
    //   language: 'en-US',
    //   movie_id: 572802,
    // );
    // _getMovieDetailUseCase.call(params: params).then((value) {
    //   print(value);
    // });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    args = ModalRoute.of(context)!.settings.arguments as ScreenArguments<int>?;

    movieId = args?.value;

    print('movieId');
    print(movieId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // title: Text(context.tr('title')),
        title: Text("Movie Detail"),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
    );
  }
}
