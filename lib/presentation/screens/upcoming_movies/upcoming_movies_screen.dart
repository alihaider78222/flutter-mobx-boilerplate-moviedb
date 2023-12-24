import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_example/constants/assets.dart';
import 'package:mobx_example/core/models/screen_args.dart';
import 'package:mobx_example/data/data_sources/remote/constants/network_constants.dart';
import 'package:mobx_example/di/service_locator.dart';
import 'package:mobx_example/domain/entities/movie/movie.dart';
import 'package:mobx_example/generated/locale_keys.g.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobx_example/presentation/routes/routes.dart';

import '../../stores/movie_store.dart';

class UpComingMoviesScreen extends StatefulWidget {
  const UpComingMoviesScreen({
    super.key,
  });
  @override
  State<UpComingMoviesScreen> createState() => _UpComingMoviesScreenState();
}

class _UpComingMoviesScreenState extends State<UpComingMoviesScreen> {
  // Stores: -------------------------------------------------------------
  final MovieStore _movieStore = getIt<MovieStore>();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    fetchData();
  }

  void fetchData() {
    // check if already called api
    if (_movieStore.moviesList == null) {
      _movieStore.getUpComingMovies();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  // app bar:-------------------------------------------------------------------
  _appBar() => AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        title: Text(
          LocaleKeys.watch.tr(),
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton.outlined(
            iconSize: 29.0,
            onPressed: () {
              Navigator.of(context).pushNamed(
                Routes.searchMovies.route,
              );
            },
            icon: SvgPicture.asset(
              Assets.searchIcon,
              // color: Theme.of(context).iconTheme.color,
            ),
          ),
        ],
      );

  // body:-------------------------------------------------------------------
  _body() => Observer(
        builder: (context) {
          return _movieStore.dataState.handleState(
            loading: () {
              return _buildLoader();
            },
            success: (data) {
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: false,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: _movieStore.moviesList?.results?.length ?? 0,
                      itemBuilder: (context, index) {
                        Movie? movie = _movieStore.moviesList?.results?[index];
                        if (movie != null) {
                          return _movieCard(movie);
                        }
                        return const SizedBox();
                      },
                    ),
                  ),
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

  // Movie card:-------------------------------------------------------------------
  _movieCard(Movie movie) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          Routes.movieDetail.route,
          arguments: ScreenArguments<int>(
            key: ScreenArgumentKeys.movieId,
            value: movie.id,
          ),
        );
      },
      child: Stack(
        children: [
          _movieCardImage(movie),
          _movieCardShadowOverlay(),
          _movieCardTitle(movie)
        ],
      ),
    );
  }

  // movie image:--------------------------------------------.-----------------------
  _movieCardImage(Movie movie) => Container(
        height: 180,
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: CachedNetworkImage(
          imageUrl: '${NetworkConstants.imageUrl}${movie.poster_path}',
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          placeholder: (context, url) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black.withAlpha(70),
            ),
          ),
          errorWidget: (context, url, error) => Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withAlpha(70),
                    offset: const Offset(2.0, 2.0),
                    blurRadius: 2.0),
              ],
            ),
            child: const Icon(Icons.error_outline),
          ),
          fadeOutDuration: const Duration(seconds: 1),
          fadeInDuration: const Duration(seconds: 3),
        ),
      );

  // movie card shadow overlay under text:-------------------------------------------------------------------
  _movieCardShadowOverlay() => Container(
        height: 180,
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          shape: BoxShape.rectangle,
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: const [0.1, 0.9],
            colors: [
              Colors.black.withOpacity(0.9),
              Colors.white.withOpacity(0.0)
            ],
          ),
        ),
      );

  // movie card title:-------------------------------------------------------------------
  _movieCardTitle(Movie movie) => Positioned(
        bottom: 0.0,
        left: 0,
        child: Container(
          margin: const EdgeInsets.only(left: 40.0, bottom: 26.0),
          child: Text(
            movie.title ?? 'N/A',
            softWrap: false,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontSize: 18, color: Colors.white),
          ),
        ),
      );
}
