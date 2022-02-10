import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:start_project/repo/films_repo.dart';
import 'package:start_project/viewmodel/film_view_model.dart';

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
          builder: (context) => MyBlocProvider<FilmBloc>(
              context,
              FilmBloc(FilmRepository())..add(LoadFilmsEvent(false)),
              const ChooseScreenBloc()),
        );

      case ChooseScreenMvvm.chooseMvvmScreenRoute:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (_) =>
                FilmViewModel(FilmRepository())..getFilmList(isShuffle: false),
            child: const ChooseScreenMvvm(),
          ),
        );

      case DetailsScreen.detailsScreenRoute:
        final arg = arguments as DetailsScreenArguments;
        return MaterialPageRoute(
          builder: (_) => DetailsScreen(
            onExitPageCallback: arg.onExitPageCallback,
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

class MyBlocProvider<T extends StateStreamableSource<Object?>>
    extends BlocProvider with BlocNavigator {
  MyBlocProvider(
    this.context,
    FilmBloc bloc,
    Widget child,
  ) : super(create: (_){print('123');return bloc;}, child: child) {
    bloc.navigator = this;
  }

  BuildContext context;

  @override
  void push(String name, Object? args) {
    Navigator.of(context).pushNamed(name, arguments: args);
  }
}
