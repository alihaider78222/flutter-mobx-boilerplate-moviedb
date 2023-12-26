# TenTwenty Assignment

Flutter boiler project with The Movie Database (TMDB) example using Clean architecture.


## How to Use

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/alihaider78222/flutter-mobx-boilerplate-project
```

**Step 2:**

rename ```.env-copy``` to ```.env``` and add your API and Access Token.

## Demo

<p style="text-align: center">
  <img src="./screenshots/demo.gif" alt="Movie Demo video">
</p>



## Screenshots

<p float="left">
  <img src="./screenshots/Screenshot_1.png" alt="image" width="220" height="auto" >
<img src="./screenshots/Screenshot_2.png" alt="image" width="220" height="auto">
<img src="./screenshots/Screenshot_3.png" alt="image" width="220" height="auto">
<img src="./screenshots/Screenshot_4.png" alt="image" width="220" height="auto">
<img src="./screenshots/Screenshot_5.png" alt="image" width="220" height="auto">
<img src="./screenshots/Screenshot_6.png" alt="image" width="220" height="auto">
<img src="./screenshots/Screenshot_7.png" alt="image" width="220" height="auto">
<img src="./screenshots/Screenshot_8.png" alt="image" width="220" height="auto">
<img src="./screenshots/Screenshot_9.png" alt="image" width="220" height="auto">
</p>

<br>

## Release / APK

apk available in [Releases](https://github.com/alihaider78222/ali-haider-tentwenty-assignment/releases) section under ```Assets```, download now to browse around.

## Easy Localization for translation

run these command in terminal to generate local keys which can be used in app

```flutter pub run easy_localization:generate --source-dir ./assets/langs```

```flutter pub run easy_localization:generate -S assets/langs -f keys -o locale_keys.g.dart```

### Libraries & Tools Used

* Dio
* MobX
* Json Serialization
* Get_it (Dependency Injection)
* Cached network image
* Easy localization
* Flutter flavor
* F_logs
* Shared_preferences
* intl
* better_player (video player)
* . . . . . .



### Folder Structure

Here is the core folder structure which flutter provides.

```
flutter-app/
├── android
├── build
├── ios
├── lib
└── test
```

Here is the folder structure we have been using in this project

```
lib/
├── constants/
├── core/
├── data/
├── di/
├── domain/
├── generated/
├── utils/
├── main_core.dart
└── main.dart
```

Now, lets dive into the lib folder which has the main code for the application.

```
1- constants - All the application level constants are defined in this directory with-in their respective files. This directory contains the constants for `theme`, `colors`, `assets` and `strings`.
2- core - Contains the core features like flavor configuration, usecase abstract class, do configuration, interceptors, logs, extensions and change settings(Theme, Fonts etc) class.
3- data - Contains the data layer of your project, includes data source directories for local and remote, and repository implementation.
4- di - Contains the dependency injection class which is executed when the app starts.
5- domain - Contains the entities, usecases and repository interfaces.
6- generated - Contains the generated localization/translation of the project.
7- presentation — Contains all the stores, ui, routes of your project, contains sub directory for each screen.
8- util — Contains the utilities/common functions of your application.
9- main_core.dart - This is the starting point of the application. Flavors are initialized here..
9- main.dart - All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.
```

### Constants

This directory contains all the application level constants. A separate file is created for each type as shown in example below:

```
 ├── constants
 |    ├── app_colors.dart
 |    ├── app_theme.dart
 |    └── assets.dart
```

### Core

This directory contains all the core method, classes of the application.

```
 ├── core
 |    ├── config
 |    |    └── flavors/
 |    ├── dio
 |    |    ├── base/...
 |    |    ├── configs/...
 |    |    ├── exception/...
 |    |    ├── interceptor/...
 |    |    └── dio_client.dart
 |    ├── extensions/...
 |    ├── logs
 |    |    └── log_utils.dart
 |    ├── models
 |    |    └── screen_args.dart
 |    ├── settings/...
 |    ├── usecase
 |    |    └── usecase.dart
 |    └── utils
 |    |    └── device_utils.dart
```

### Data

This directory is the data layer of the application and contain all the data layer logic like repository implementation and fetch data from either remote or local data sources.

```
 ├── data
 |    ├── data_sources
 |    |    ├── local
 |    |    └── remote
 |    |    |   ├── apis
 |    |    |   |      └── movies
 |    |    |   |          ├── movie_api.dart
 |    |    |   |          └── movie_api_impl.dart
 |    |    |   ├── constants
 |    |    |   |    └── network_constants.dart
 |    |    |   └── dtos
 |    ├── di
 |    |    ├── module
 |    |    |    ├── network_module
 |    |    |    |     └── network_module.dart
 |    |    |    └── repository_module
 |    |    |    |     └── repository_module.dart
 |    |    └── data_layer_injection.dart
 |    └── repository
 |    |    └── movies
 |    |          └── movies_repository_impl.dart

```

### Domain

This directory is the domain layer of the application and contain all the logical entities, usecases and repository interfaces.

```
 ├── domain
 |    ├── di
 |    |    ├── module
 |    |    |    └── usecase_module.dart
 |    |    └── domain_layer_injection.dart
 |    ├── entities
 |    |    └── movie
 |    |    |     ├── movie.dart
 |    |    |     ├── movies_list.dart
 |    |    |     ├── movie_detail.dart
 |    |    |     └── trailer_video.dart
 |    ├── repository_interfaces
 |    |    └── movies
 |    |    |     └── movies_repository.dart
 |    └── usecases
 |    |    └── movies
 |    |    |     ├── get_movie_detail.dart
 |    |    |     ├── get_search_movies.dart
 |    |    |     ├── get_trailer_videos.dart
 |    |    |     └── get_upcoming_movies.dart
```

### Presentation

This directory is the presentation layer of the application and contain all the UI screens, Common Widgets, Routes and Stores(State Holder) and Dependency injection folder of this layer.

```
 ├── presentation
 |    ├── common_widgets
 |    ├── di
 |    |   ├── module
 |    |   | └── stateholder_module.dart
 |    |   └── presentation_layer_injection.dart
 |    ├── routes
 |    |   └── routes.dart
 |    ├── screens
 |    |   ├── get_ticket
 |    |   |   └── get_ticket_screen.dart
 |    |   ├── home
 |    |   |   └── home.dart
 |    |   ├── movie_detail
 |    |   |   └── movie_detail_screen.dart
 |    |   ├── search_movies
 |    |   |   └── search_movies_screen.dart
 |    |   ├── settings
 |    |   |   └── settings_screen.dart
 |    |   ├── upcoming_movies
 |    |   |   └── upcoming_movies_screen.dart
 |    |   └── watch_trailer
 |    |   |   └── watch_trailer.dart
 |    └── stores
 |    |   ├── home_store.dart
 |    |   └── movie_store.dart
```

### Main Core

This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.

### Main

This is where App Flavors are defined which are used further if we need to change API Base urls depending upon the flavors.

## Wiki

Checkout [wiki](https://github.com/zubairehman/flutter_boilerplate_project/wiki) for more info

## Conclusion

It is an example only. If you liked my work, don’t forget to ⭐ star the repo to show your support.
