## Feature

- Get Pattern by [Get](https://pub.dev/packages/get)
- Navigate pages by [Get](https://pub.dev/packages/get)
- Dependencies by [Get](https://pub.dev/packages/get)
- Restful api call by using [Dio](https://github.com/flutterchina/dio)
- Localization by using [GetX](https://pub.dev/packages/get)

## Install

1. Follow flutter [official setup guide](https://flutter.io/docs/get-started/install) to set up
   flutter environment
2. Download [flutter version](https://flutter.dev/docs/development/tools/sdk/releases)

## Useful Command

### Run flutter_starter_kit

```
flutter create .
```

For development,

```
flutter run --flavor dev
```

For production,

```
flutter run --flavor production
```

### Generate json serialize and deserialize functions

```
flutter packages pub run build_runner build --delete-conflicting-outputs
```

### Generate assets file , before use generate, you need active fluttergen global

```
 dart pub global activate flutter_gen
```

then

```
 fluttergen -c pubspec.yaml
```

### To generate a localization file: Note: 'assets/locales' directory with your translation files in json format

```
get generate locales assets/locales  (need run flutter pub global activate get_cli the first time)
```

or

```

get generate locales assets/locales (need run flutter pub global activate get_cli the first time)
```

### Just need enter vietnam in google sheet file and run

```                        
npm run set-language-data
```

### Generate splash screen

```
flutter pub run flutter_native_splash:create
```

### Generate app icon

```
flutter pub run flutter_launcher_icons
```

### Build apk

For development,

```
flutter build apk --flavor dev
```

For production,

```
flutter build apk --flavor production
```

### Build ios

For development,

```
flutter build ios --flavor dev
```

For production,

```
flutter build ios --flavor production
```

### Build bundle google store

```
flutter build appbundle --flavor production
```
