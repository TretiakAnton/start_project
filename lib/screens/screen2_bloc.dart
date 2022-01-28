import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:start_project/bloc/bloc.dart';
import 'package:start_project/film.dart';
import 'package:start_project/screens/screens.dart';
import 'package:start_project/screens/ui_tools/custom_widgets.dart';

class Screen2Bloc extends StatefulWidget {
  const Screen2Bloc({Key? key}) : super(key: key);
  static const String detailsScreenRoute = 'screen2Bloc';

  @override
  State<Screen2Bloc> createState() => _Screen2BlocState();
}

class _Screen2BlocState extends State<Screen2Bloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of Films'),
      ),
      body: Center(child: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
        return BlocBuilder<BlocSecondScreen, FilmState>(
            builder: (_, filmState) {
          if (filmState is FilmLoadedState) {
            if (orientation == Orientation.portrait) {
              return RefreshIndicator(
                onRefresh: () async {
                  BlocProvider.of<BlocSecondScreen>(context)
                      .add(LoadFilmsEvent(true));
                },
                child: listOfFilms(
                    Screen3Bloc.detailsScreenRoute, filmState.films),
              );
            } else {
              return Landscape(
                const Film('', ''),
                ifSelected: false,
                list: filmState.films,
                screenRoute: Screen3Bloc.detailsScreenRoute,
              );
            }
          } else {
            return loading();
          }
        });
      })),
    );
  }
}
