import 'package:flutter/material.dart';
import 'film.dart';
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

      case Screen3Bloc.detailsScreenRoute:
        Film filmArgument;
        filmArgument = settings.arguments as Film;
        return MaterialPageRoute(
          builder: (_) => Screen3Bloc(film: filmArgument),
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
