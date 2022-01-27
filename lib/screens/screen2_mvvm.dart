import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:start_project/bloc/bloc.dart';
import 'package:start_project/screens/screens.dart';
import 'package:start_project/screens/ui_tools/custom_widgets.dart';
import 'package:start_project/viewmodel/film_view_model.dart';

class Screen2Mvvm extends StatefulWidget {
  static const String detailsScreenRoute = 'screen2Mvvm';

  const Screen2Mvvm({Key? key}) : super(key: key);

  @override
  State<Screen2Mvvm> createState() => _Screen2MvvmState();
}

class _Screen2MvvmState extends State<Screen2Mvvm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of Films'),
      ),
      body: Center(child: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            final FilmViewModel filmViewModel = context.watch<FilmViewModel>();
        if (orientation == Orientation.portrait) {
          return RefreshIndicator(
            onRefresh: () async {
              BlocProvider.of<BlocSecondScreen>(context)
                  .add(LoadFilmsEvent(true));
            },
            child: listOfFilms(Screen3.detailsScreenRoute, filmViewModel.filmList),
          );
        } else if (orientation == Orientation.landscape) {
          return landscape();
        }
      })),
    );
  }
}
