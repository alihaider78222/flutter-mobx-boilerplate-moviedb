import 'package:flutter/material.dart';
import 'package:mobx_example/di/service_locator.dart';
import 'package:mobx_example/domain/usecases/movies/get_movie_detail.dart';
import 'package:mobx_example/domain/usecases/movies/get_search_movies.dart';

class SearchMoviesScreen extends StatefulWidget {
  const SearchMoviesScreen({
    super.key,
  });
  @override
  State<SearchMoviesScreen> createState() => _SearchMoviesScreenState();
}

class _SearchMoviesScreenState extends State<SearchMoviesScreen> {
  final _getSearchMoviesUseCase = getIt<GetSearchMoviesUseCase>();

  @override
  void initState() {
    super.initState();

    var params = SearchMoviesParams(
      language: 'en-US',
      query: 'aqua',
      page: 1,
    );
    _getSearchMoviesUseCase.call(params: params).then((value) {
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
