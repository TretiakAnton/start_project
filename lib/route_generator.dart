import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:start_project/bloc/film_details_bloc.dart';
import 'package:start_project/bloc/film_list_bloc.dart';
import 'package:start_project/repo/films_repo.dart';
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
          builder: (_) => MultiProvider(
            providers: [
              Provider<FilmBloc>(create: (_) => FilmBloc(FilmRepository())),
              Provider<FilmDetailsBloc>(create: (_) => FilmDetailsBloc()),
            ],
            child: const ChooseScreenBloc(),
          ),
        );

      case ChooseScreenMvvm.detailsScreenRoute:
        return MaterialPageRoute(
          builder: (_) => const ChooseScreenMvvm(),
        );

      case DetailsScreen.detailsScreenRoute:
        final args = arguments as DetailsScreenArgumets;
        return MaterialPageRoute(
          builder: (_) => DetailsScreen(
              film: args.film, onExitCallback: args.onExitCallback),
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
