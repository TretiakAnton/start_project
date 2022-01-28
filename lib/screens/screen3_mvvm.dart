import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:start_project/screens/ui_tools/custom_widgets.dart';
import 'package:start_project/viewmodel/film_view_model.dart';

class Screen3Mvvm extends StatefulWidget {
  final int selectedFilm;
  static const String detailsScreenRoute = 'screen3Mvvm';

  Screen3Mvvm({Key? key, required this.selectedFilm}) : super(key: key);

  @override
  State<Screen3Mvvm> createState() => _Screen3MvvmState();
}

class _Screen3MvvmState extends State<Screen3Mvvm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Center(
        child: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            final FilmViewModel filmViewModel = context.watch<FilmViewModel>();
            if (orientation == Orientation.portrait) {
              return details(filmViewModel.film);
            } else {
              return Landscape(filmViewModel.film,
                  ifSelected: true,
                  screenRoute: Screen3Mvvm.detailsScreenRoute,
                  list: filmViewModel.filmList);
            }
          },
        ),
      ),
    );
  }
}
