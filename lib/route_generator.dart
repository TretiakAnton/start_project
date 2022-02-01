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

      case DetailsScreenBloc.detailsScreenRoute:

        int selectedFilm = 0;
        List<Film> films = List.empty();
        if(arguments!= null){
        selectedFilm = arguments['index'];
        films = arguments['films'];
        }
        return MaterialPageRoute(
          builder: (_) => DetailsScreenBloc(selectedFilm: selectedFilm, films: films,),
        );

      case DetailsScreenMvvm.detailsScreenRoute:
        int selectedFilm = 0;
        if (arguments is int) {
          selectedFilm = arguments;
        }
        return MaterialPageRoute(
          builder: (_) => DetailsScreenMvvm(selectedFilmId: selectedFilm),
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
