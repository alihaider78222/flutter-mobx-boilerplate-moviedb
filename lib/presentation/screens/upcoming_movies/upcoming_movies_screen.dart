import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mobx_example/di/service_locator.dart';
import 'package:mobx_example/domain/usecases/movies/get_upcoming_movies.dart';
import 'package:mobx_example/generated/locale_keys.g.dart';

class UpComingMoviesScreen extends StatefulWidget {
  const UpComingMoviesScreen({
    super.key,
  });
  @override
  State<UpComingMoviesScreen> createState() => _UpComingMoviesScreenState();
}

class _UpComingMoviesScreenState extends State<UpComingMoviesScreen> {
  int _counter = 0;

  var _getUpComingMoviesUseCase = getIt<GetUpComingMoviesUseCase>();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();

    var params = UpComingMoviesParams(
      language: 'en-US',
      page: 1,
    );
    _getUpComingMoviesUseCase.call(params: params).then((value) {
      print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // title: Text(context.tr('title')),
        title: Text(LocaleKeys.title.tr()),
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
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
