import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:start_project/repo/films_repo.dart';

import 'bloc/bloc.dart';
import 'screens/screens.dart';

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final String? name = settings.name;
    final dynamic arguments = settings.arguments;

    if (name == null) {
      return RouteGenerator.onUnknownRoute(settings);
    }

    switch (name) {
      case HomeScreen.homeScreenRoute:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );

      case ChooseScreenBloc.chooseBlocScreenRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<FilmBloc>(
              create: (context) =>
                  FilmBloc(FilmRepository())..add(LoadFilmsEvent(false)),
              child: const ChooseScreenBloc()),
        );

      case ChooseScreenMvvm.chooseMvvmScreenRoute:
        return MaterialPageRoute(//model
          builder: (_) => const ChooseScreenMvvm(),
        );

      case DetailsScreen.detailsScreenRoute:
        final arg = arguments as DetailsScreenArguments;
        return MaterialPageRoute(
          builder: (_) => DetailsScreen(
            callback: arg.callback,
            film: arg.film,
          ),
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
