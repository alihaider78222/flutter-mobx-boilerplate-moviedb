# mobx_example

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Easy Localization for translation

run these command in terminal to generate local keys which can be used in app

```flutter pub run easy_localization:generate --source-dir ./assets/langs```

```flutter pub run easy_localization:generate -S assets/langs -f keys -o locale_keys.g.dart```
