import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_example/constants/app_colors.dart';
import 'package:mobx_example/core/models/screen_args.dart';
import 'package:mobx_example/data/data_sources/remote/constants/network_constants.dart';
import 'package:mobx_example/di/service_locator.dart';
import 'package:mobx_example/domain/entities/movie/movie_detail.dart';
import 'package:mobx_example/generated/locale_keys.g.dart';
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

  final List<Color> colors = [
    AppColors.cyan,
    AppColors.pink,
    AppColors.purple,
    AppColors.yellow,
  ];

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
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (_movieStore.movieDetail != null) ...[
                      _movieCard(_movieStore.movieDetail!),
                      _getGenresAndOverview(_movieStore.movieDetail!)
                    ]
                  ],
                ),
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

  // Movie  Details:-------------------------------------------------------------------
  _movieCard(MovieDetail movieDetail) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        _movieCardImage(movieDetail.posterPath),
        _movieCardShadowOverlay(),
        _backButtonWidget(),
        _getCenterItems()
      ],
    );
  }

  // movie image:--------------------------------------------.-----------------------
  _movieCardImage(String? path, {double height = 445}) => Container(
        height: height,
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        child: CachedNetworkImage(
          imageUrl: '${NetworkConstants.imageUrl}$path',
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          placeholder: (context, url) => Container(
            decoration: BoxDecoration(
              color: Colors.black.withAlpha(70),
            ),
          ),
          errorWidget: (context, url, error) => Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(color: Colors.black.withAlpha(70)),
              ],
            ),
            child: const Icon(Icons.error_outline),
          ),
          fadeOutDuration: const Duration(seconds: 1),
          fadeInDuration: const Duration(seconds: 3),
        ),
      );

  // Back button widget

  Widget _backButtonWidget() => Positioned(
        top: 20,
        left: 15,
        child: Row(
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 22,
              ),
            ),
            Text(
              'Watch',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      );

  // movie card shadow overlay under text:-------------------------------------------------------------------
  Widget _movieCardShadowOverlay() => Container(
        height: 445,
        margin: EdgeInsets.zero,
        decoration: BoxDecoration(
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

  _getCenterItems() => Positioned.fill(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              _inTheatersText(),
              const SizedBox(height: 8),
              _getTicketButton(),
              const SizedBox(height: 8),
              _watchTrailerButton(),
              const SizedBox(height: 24)
            ],
          ),
        ),
      );

  Widget _inTheatersText() => Container(
        width: 170,
        child: Text(
          'In theaters ${DateFormat('MMM dd, yyyy').format(_movieStore.movieDetail!.releaseDate!)}',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
        ),
      );

  Widget _getTicketButton() {
    return ElevatedButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(
          AppColors.blue,
        ),
        minimumSize: MaterialStateProperty.all(Size(170, 44)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
      onPressed: () {},
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.0, vertical: 8),
        child: Text(
          "Get Tickets",
        ),
      ),
    );
  }

  Widget _watchTrailerButton() => OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.blue,
            side: const BorderSide(width: 1.0, color: AppColors.blue),
            minimumSize: Size(170, 44),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            )),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.play_arrow,
              color: Colors.white,
            ),
            SizedBox(width: 4),
            Text(
              'Watch Trailer',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      );

  Widget _getGenresAndOverview(MovieDetail movieDetail) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.genres.tr(),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(
              // width: double.infinity,
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _movieStore.movieDetail?.genres!.length ?? 0,
                itemBuilder: (context, index) {
                  var genre = _movieStore.movieDetail?.genres?[index];
                  // Calculate the color index using modulo to cycle through the colors
                  int colorIndex = index % colors.length;
                  Color chipColor = colors[colorIndex];

                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Chip(
                      backgroundColor: chipColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              20.0) // Adjust the value for more or less circular shape
                          ),
                      label: Text(
                        genre?.name ?? '',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 4),
            const Divider(color: AppColors.grey),
            const SizedBox(height: 14),
            Text(
              LocaleKeys.overview.tr(),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 10),
            Text(
              movieDetail.overview ?? 'N/A',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    height: 1.5,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey,
                  ),
            )
          ],
        ),
      );
}
