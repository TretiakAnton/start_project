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
      case HomeScreen.detailsScreenRoute:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );

      case ChooseScreenBloc.detailsScreenRoute:
        return MaterialPageRoute(
            builder: (_) =>
                BlocProvider<FilmBloc>(
                create: (context) =>
                  FilmBloc(FilmRepository())..add(LoadFilmsEvent(false)),
                   child:
                const ChooseScreenBloc()
            ),
            );

      case ChooseScreenMvvm.detailsScreenRoute:
        return MaterialPageRoute(
          builder: (_) => const ChooseScreenMvvm(),
        );

      case DetailsBlocScreen.detailsScreenRoute:
        Function(int) callback= (int i){i++;};
        if (arguments is Function(int)) {
          callback = arguments;
        }
        return MaterialPageRoute(
          builder: (_) => DetailsBlocScreen(
            callback: callback,
          ),
        );

      case DetailsMvvmScreen.detailsScreenRoute:
        Function(int) callback= (int i){i++;};
        if (arguments is Function(int)) {
          callback = arguments;
        }
        return MaterialPageRoute(
          builder: (_) => DetailsMvvmScreen(
            callback: callback,
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
