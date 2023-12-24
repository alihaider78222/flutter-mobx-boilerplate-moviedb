import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobx_example/constants/app_colors.dart';
import 'package:mobx_example/constants/assets.dart';
import 'package:mobx_example/core/models/screen_args.dart';
import 'package:mobx_example/core/utils/device_utils.dart';
import 'package:mobx_example/di/service_locator.dart';
import 'package:mobx_example/domain/entities/movie/movie.dart';
import 'package:mobx_example/presentation/routes/routes.dart';
import 'package:mobx_example/presentation/stores/movie_store.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:mobx_example/data/data_sources/remote/constants/network_constants.dart';

enum SearchMode {
  IDOL('IDOL'), // Iin idol state
  SEARCHING('SEARCHING'), // searching when something type
  SEARCHED('SEARCHED'); // when Done button on keyboard is pressed

  final String value;
  const SearchMode(this.value);
}

class SearchMoviesScreen extends StatefulWidget {
  const SearchMoviesScreen({
    super.key,
  });
  @override
  State<SearchMoviesScreen> createState() => _SearchMoviesScreenState();
}

class _SearchMoviesScreenState extends State<SearchMoviesScreen> {
  // Stores: -------------------------------------------------------------
  final MovieStore _movieStore = getIt<MovieStore>();

  // variables
  FocusNode inputNode = FocusNode();

  SearchMode searchMode = SearchMode.IDOL;

  SearchController? controller = SearchController();

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _body(),
      ),
    );
  }

  // body:-------------------------------------------------------------------
  Widget _body() => Observer(builder: (context) {
        return CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  padding: const EdgeInsets.only(top: 16, left: 0, right: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      if (searchMode == SearchMode.IDOL ||
                          searchMode == SearchMode.SEARCHING)
                        _searchBarWidget(),
                      if (searchMode == SearchMode.SEARCHED)
                        _searchedResultsTopBar(),
                      const SizedBox(
                        height: 26,
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                if (searchMode == SearchMode.IDOL &&
                    (_movieStore.searchMoviesList?.results ?? []).isEmpty) ...[
                  const SizedBox(
                    height: 260,
                  ),
                  SvgPicture.asset(
                    Assets.searchIcon,
                    height: 60,
                  ),
                  const Center(child: Text('No search results yet!')),
                ],
                if (searchMode == SearchMode.SEARCHING)
                  Container(
                    padding: const EdgeInsets.only(
                        top: 26, left: 16, right: 16, bottom: 8),
                    color: AppColors.lightGrey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Top Results',
                          softWrap: true,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        const Divider(
                          height: 1,
                          color: AppColors.grey,
                        )
                      ],
                    ),
                  ),
              ]),
            ),
            _searchingResults(),
          ],
        );
      });

  // SearchBar
  Widget _searchBarWidget() => Container(
        height: 52,
        margin: const EdgeInsets.symmetric(horizontal: 21),
        child: SearchBar(
          controller: controller,
          hintText: 'Search movies here... ',
          focusNode: inputNode,
          backgroundColor: MaterialStateProperty.all(
            AppColors.lightGrey,
          ),
          shadowColor: MaterialStateProperty.all(
            Colors.transparent,
          ),
          surfaceTintColor: MaterialStateProperty.all(
            AppColors.grey,
          ),
          padding: const MaterialStatePropertyAll<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 16.0)),
          onTap: () {
            DeviceUtils.openKeyboard(context, inputNode);
          },
          onChanged: (_) {
            print('onChanged');
            _checkSearchContent();
          },
          onSubmitted: (_) {
            print('onSubmitted');
            // _checkSearchContent();
            searchMode = SearchMode.SEARCHED;
          },
          leading: SvgPicture.asset(
            Assets.searchIcon,
          ),
          trailing: <Widget>[
            if (controller?.text != '')
              Tooltip(
                message: 'Clear Search',
                child: IconButton(
                  isSelected: false,
                  onPressed: () {
                    _clearSearch();
                  },
                  icon: SvgPicture.asset(
                    Assets.closeIcon,
                  ),
                ),
              )
          ],
        ),
      );

  Widget _searchedResultsTopBar() => Container(
        child: Row(
          children: [
            IconButton(
              isSelected: false,
              onPressed: () {
                _clearSearch();
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_rounded,
                color: AppColors.black,
              ),
            ),
            Text(
              '${(_movieStore.searchMoviesList?.results ?? []).length.toString()} results found',
              style:
                  Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 22),
            )
          ],
        ),
      );

  SliverList _searchingResults() => SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            Movie? movie = _movieStore.searchMoviesList?.results?[index];
            if (movie != null) {
              return _searchMovieCard(movie);
            }
            return const SizedBox();
          },
          childCount: _movieStore.searchMoviesList?.results?.length ?? 0,
        ),
      );

  Widget _searchMovieCard(Movie movie) => GestureDetector(
        onTap: () {
          DeviceUtils.hideKeyboard(context);
          Navigator.of(context).pushNamed(
            Routes.movieDetail.route,
            arguments: ScreenArguments<int>(
              key: ScreenArgumentKeys.movieId,
              value: movie.id,
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          color: AppColors.lightGrey,
          child: Row(
            children: [
              _movieCardImage(movie),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      movie.title ?? 'N/A',
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      movie.genre_ids != null &&
                              movie.genre_ids!.isNotEmpty &&
                              movie.genre_ids?.first != null
                          ? getGenreName(movie.genre_ids?.first)
                          : '',
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(fontSize: 14, color: AppColors.grey),
                    ),
                  ],
                ),
              ),
              IconButton(
                isSelected: false,
                onPressed: () {},
                icon: const Icon(
                  Icons.more_horiz,
                  color: AppColors.blue,
                ),
              ),
            ],
          ),
        ),
      );

  _movieCardImage(Movie movie) => Container(
        height: 100,
        width: 130,
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
              borderRadius: BorderRadius.circular(10),
              color: Colors.black.withAlpha(70),
            ),
            child: const Icon(Icons.error_outline),
          ),
          fadeOutDuration: const Duration(seconds: 1),
          fadeInDuration: const Duration(seconds: 3),
        ),
      );

  String getGenreName(int? id) {
    return _movieStore.genresMap[id.toString()];
  }

  _checkSearchContent() {
    if (controller?.text != '') {
      searchMode = SearchMode.SEARCHING;
      _movieStore.getSearchMovies(controller?.text ?? '');
    } else {
      searchMode = SearchMode.IDOL;
      _clearSearch();
    }
    setState(() {});
  }

  _clearSearch() {
    setState(() {
      searchMode = SearchMode.IDOL;
      controller?.text = '';
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
