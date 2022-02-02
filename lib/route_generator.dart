import 'package:flutter/material.dart';
import 'package:start_project/film.dart';
import 'screens/screens.dart';

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final String? name = settings.name;
    final dynamic arguments = settings.arguments;

    if (name == null) {
      return RouteGenerator.onUnknownRoute(settings);
    }

    switch (name) {
      case HomeScreen.detailsScreenRoute:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );

      case ChooseScreenBloc.detailsScreenRoute:
        return MaterialPageRoute(
          builder: (_) => const ChooseScreenBloc(),
        );

      case ChooseScreenMvvm.detailsScreenRoute:
        return MaterialPageRoute(
          builder: (_) => const ChooseScreenMvvm(),
        );

      case DetailsScreen.detailsScreenRoute:
        Film selectedFilm= const Film('', '');
        if (arguments is Film) {
          selectedFilm = arguments;
        }
        return MaterialPageRoute(
          builder: (_) => DetailsScreen(selectedFilm: selectedFilm),
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
