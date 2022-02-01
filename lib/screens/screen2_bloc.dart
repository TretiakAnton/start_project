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
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              if (MediaQuery.of(context).orientation == Orientation.landscape) {
                Navigator.of(context).popUntil((route) => route.isFirst);
              } else {
                Navigator.of(context).pop();
              }
            }),
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
                child: ListOfFilms(
                  list: filmState.films,
                  onFilmSelected: (int index) {
                    Navigator.of(context).pushNamed(
                        Screen3Bloc.detailsScreenRoute,
                        arguments: {'index': index, 'films': filmState.films});
                  },
                  ifSelected: false,
                  selectedFilm: const Film('', ''),
                ),
              );
            } else {
              return Landscape(
                const Film('', ''),
                ifSelected: false,
                list: filmState.films,
                onFilmSelected: (int index) {
                  Navigator.of(context).pushNamed(
                      Screen3Bloc.detailsScreenRoute,
                      arguments: {'index': index, 'films': filmState.films});
                },
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
