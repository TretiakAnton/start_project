import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:start_project/bloc/bloc.dart';
import 'package:start_project/screens/screen3_mvvm.dart';
import 'package:start_project/screens/ui_tools/custom_widgets.dart';

class Screen3Bloc extends StatefulWidget {
  final int selectedFilm;
  static const String detailsScreenRoute = 'screen3Bloc';

  Screen3Bloc({Key? key, required this.selectedFilm}) : super(key: key);

  @override
  State<Screen3Bloc> createState() => _Screen3BlocState();
}

class _Screen3BlocState extends State<Screen3Bloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Center(
        child: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            return BlocBuilder<FilmBloc, FilmState>(builder: (_, filmState) {
              BlocProvider.of<FilmBloc>(context)
                  .add(SelectFilmEvent(widget.selectedFilm));
              if (filmState is FilmLoadedState) {
                if (orientation == Orientation.portrait) {
                  return details(filmState.selectedFilm);
                } else {
                  return Landscape(filmState.selectedFilm, ifSelected: true, screenRoute: Screen3Mvvm.detailsScreenRoute, list: filmState.films);
                  //return landscape(true,Screen3Bloc.detailsScreenRoute, filmState.films,filmState.selectedFilm);
                }
              } else {
                return loading();
              }
            });
          },
        ),
      ),
    );
  }
}
