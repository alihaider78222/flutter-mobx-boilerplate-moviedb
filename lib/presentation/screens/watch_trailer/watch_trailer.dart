import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_example/core/models/screen_args.dart';
import 'package:better_player/better_player.dart';
import 'package:mobx_example/di/service_locator.dart';
import 'package:mobx_example/presentation/stores/movie_store.dart';

class WatchTrailerScreen extends StatefulWidget {
  const WatchTrailerScreen({super.key});

  @override
  State<WatchTrailerScreen> createState() => _WatchTrailerScreenState();
}

class _WatchTrailerScreenState extends State<WatchTrailerScreen> {
  // Stores: -------------------------------------------------------------
  final MovieStore _movieStore = getIt<MovieStore>();

  // variables: -------------------------------------------------------------
  ScreenArguments<int>? args;
  int? movieId;

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
    _movieStore.getTrailerVideos(movieId);
  }

//  @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Example player"),
//       ),
//       body: AspectRatio(
//         aspectRatio: 16 / 9,
//         child: BetterPlayer.network(
//           "http://api.themoviedb.org/3/movie/$movieId/videos",
//           betterPlayerConfiguration: BetterPlayerConfiguration(
//             aspectRatio: 16 / 9,
//           ),
//         ),
//       ),
//     );
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  // body:-------------------------------------------------------------------
  _body() => Observer(
        builder: (context) {
          return _movieStore.dataStateTrailerVideos.handleState(
            loading: () {
              return _buildLoader();
            },
            success: (data) {
              // if (getVideoUrl() != null) {
              return Column(
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: BetterPlayer.network(
                      // getVideoUrl()!,
                      // 'https://www.youtube.com/watch?v=wJ2UPmg1zLI',
                      _movieStore.trailerVideo ?? '',
                      betterPlayerConfiguration: BetterPlayerConfiguration(
                        aspectRatio: 16 / 9,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Video Url"),
                  Text("${_movieStore.trailerVideo}")
                ],
              );
              // }
              // return Text("Invalid url");
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

  // String? getVideoUrl() {
  //   var list = _movieStore.trailerVideosList?.results ?? [];
  //   String? videoUrl;

  //   for (Result element in list) {
  //     if (element.site == "YouTube") {
  //       videoUrl = "https://www.youtube.com/watch?v=${element.key}";
  //       break;
  //     }
  //   }

  //   return videoUrl;
  // }
}
