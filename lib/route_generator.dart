import 'package:flutter/material.dart';
import 'screens/screens.dart';

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final String? name = settings.name;
    final Object? arguments = settings.arguments;

    if (name == null) {
      return RouteGenerator.onUnknownRoute(settings);
    }

    switch (name) {
      case Screen1.detailsScreenRoute:
        return MaterialPageRoute(
          builder: (_) => const Screen1(),
        );

      case Screen2Bloc.detailsScreenRoute:
        return MaterialPageRoute(
          builder: (_) => const Screen2Bloc(),
        );

      case Screen2Mvvm.detailsScreenRoute:
        return MaterialPageRoute(
          builder: (_) => const Screen2Mvvm(),
        );

      case Screen3Bloc.detailsScreenRoute:
        int selectedFilm = 0;
        if (arguments is int) {
          selectedFilm = arguments;
        }
        return MaterialPageRoute(
          builder: (_) => Screen3Bloc(selectedFilm: selectedFilm),
        );

      case Screen3Mvvm.detailsScreenRoute:
        int selectedFilm = 0;
        if (arguments is int) {
          selectedFilm = arguments;
        }
        return MaterialPageRoute(
          builder: (_) => Screen3Mvvm(selectedFilm: selectedFilm),
        );

      default:
        return RouteGenerator.onUnknownRoute(settings);
    }
  }

  static Route<dynamic> onUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Page not found'),
        ),
      );
    });
  }
}
