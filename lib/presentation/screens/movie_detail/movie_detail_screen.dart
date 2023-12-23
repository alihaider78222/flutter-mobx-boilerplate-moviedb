import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_example/core/models/screen_args.dart';
import 'package:mobx_example/di/service_locator.dart';
import 'package:mobx_example/presentation/stores/movie_store.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({
    super.key,
  });
  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  // Stores: -------------------------------------------------------------
  final MovieStore _movieStore = getIt<MovieStore>();

  // variables: -------------------------------------------------------------
  ScreenArguments<int>? args;
  int? movieId;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    args = ModalRoute.of(context)!.settings.arguments as ScreenArguments<int>?;
    movieId = args?.value;

    if (movieId != null) {
      fetchData(movieId!);
    }
  }

  void fetchData(int movieId) {
    _movieStore.getMovieDetail(movieId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  // body:-------------------------------------------------------------------
  _body() => Observer(
        builder: (context) {
          return _movieStore.dataStateMovieDetail.handleState(
            loading: () {
              return _buildLoader();
            },
            success: (data) {
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    _movieStore.movieDetail?.originalTitle ??
                        _movieStore.movieDetail?.title ??
                        'N/A',
                    style: TextStyle(color: Colors.black),
                  )
                ],
              );
            },
            error: (error) {
              return Center(child: Text(error.toString()));
            },
          );
        },
      );

  // Loader
  Widget _buildLoader() => const Align(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      );
}
