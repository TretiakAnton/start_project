import 'package:flutter/material.dart';
import 'screens/screens.dart';

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final String? name = settings.name;

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
        return MaterialPageRoute(
          builder: (_) => const Screen3Bloc(),
        );

      case Screen2MVVM.detailsScreenRoute:
        return MaterialPageRoute(
          builder: (_) => const Screen2MVVM(),
        );

      case Screen3MVVM.detailsScreenRoute:
        return MaterialPageRoute(
          builder: (_) => const Screen3MVVM(),
        );

      case Screen4MVVM.detailsScreenRoute:
        return MaterialPageRoute(
          builder: (_) => const Screen4MVVM(),
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
