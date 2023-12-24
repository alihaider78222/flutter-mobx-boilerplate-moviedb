import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobx_example/constants/app_colors.dart';
import 'package:mobx_example/constants/assets.dart';
import 'package:mobx_example/di/service_locator.dart';
import 'package:mobx_example/generated/locale_keys.g.dart';
import 'package:mobx_example/presentation/routes/routes.dart';
import 'package:mobx_example/presentation/screens/search_movies/search_movies_screen.dart';
import 'package:mobx_example/presentation/screens/settings/settings_screen.dart';
import 'package:mobx_example/presentation/screens/upcoming_movies/upcoming_movies_screen.dart';
import 'package:mobx_example/presentation/stores/home_store.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // store:---------------------------------------------------------------------
  final HomeStore _homeStore = getIt<HomeStore>();

  // tabs:----------------------------------------------------------------------
  final List<Widget> _tabs = <Widget>[
    const UpComingMoviesScreen(),
    const UpComingMoviesScreen(),
    const SearchMoviesScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      _homeStore.selectedIndex;
      return Scaffold(
        body: SafeArea(child: _buildBody()),
        bottomNavigationBar: AnimatedContainer(
          height: 80,
          duration: const Duration(milliseconds: 350),
          curve: Curves.fastOutSlowIn,
          child: ClipRect(child: _buildBottomNavigation()),
        ),
      );
    });
  }

  // body ------------------------------------------------------
  Widget _buildBody() {
    return Center(
      child: _tabs.elementAt(_homeStore.selectedIndex),
    );
  }

  // bottom navigation ------------------------------------------
  NavigationBarTheme _buildBottomNavigation() {
    const Color selectedIconColor = Colors.white;
    return NavigationBarTheme(
      data: NavigationBarThemeData(
          indicatorColor: Colors.transparent,
          // labelTextStyle: MaterialStateProperty.all(
          //   const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          // ),
          labelTextStyle: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed) ||
                states.contains(MaterialState.selected)) {
              return const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              );
            }
            return const TextStyle(
              color: AppColors.grey,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            );
          }),
          iconTheme:
              MaterialStateProperty.all(IconThemeData(color: AppColors.grey))),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(22.0),
          topRight: Radius.circular(22.0),
        ),
        child: Observer(builder: (context) {
          return NavigationBar(
            backgroundColor: AppColors.black,
            selectedIndex: _homeStore.selectedIndex,
            onDestinationSelected: _onItemTapped,
            destinations: [
              NavigationDestination(
                icon: SvgPicture.asset(
                  Assets.dashboardIcon,
                ),
                selectedIcon: SvgPicture.asset(
                  Assets.dashboardIcon,
                  color:
                      _homeStore.selectedIndex == 0 ? selectedIconColor : null,
                ),
                label: 'Dashboard',
              ),
              NavigationDestination(
                icon: SvgPicture.asset(
                  Assets.watchIcon,
                ),
                selectedIcon: SvgPicture.asset(
                  Assets.watchIcon,
                  color:
                      _homeStore.selectedIndex == 1 ? selectedIconColor : null,
                ),
                label: 'Watch',
              ),
              NavigationDestination(
                icon: SvgPicture.asset(
                  Assets.mediaLibrary,
                ),
                selectedIcon: SvgPicture.asset(
                  Assets.mediaLibrary,
                  color:
                      _homeStore.selectedIndex == 2 ? selectedIconColor : null,
                ),
                label: 'Media Library',
              ),
              NavigationDestination(
                icon: SvgPicture.asset(
                  Assets.listIcon,
                ),
                selectedIcon: SvgPicture.asset(
                  Assets.listIcon,
                  color:
                      _homeStore.selectedIndex == 3 ? selectedIconColor : null,
                ),
                label: 'More',
              ),
            ],
          );
        }),
      ),
    );
  }

  void _onItemTapped(int index) {
    _homeStore.setSelectedIndex(index);
  }
}
