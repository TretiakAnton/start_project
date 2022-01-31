import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';
import 'package:start_project/film.dart';
import 'package:start_project/screens/screens.dart';
import 'package:start_project/screens/ui_tools/custom_widgets.dart';
import 'package:start_project/viewmodel/film_view_model.dart';

class Screen2Mvvm extends StatefulWidget {
  const Screen2Mvvm({Key? key}) : super(key: key);
  static const String detailsScreenRoute = 'screen2Mvvm';

  @override
  State<Screen2Mvvm> createState() => _Screen2MvvmState();
}

class _Screen2MvvmState extends State<Screen2Mvvm> {
  @override
  void initState() {
    super.initState();
    context.read<FilmViewModel>().getFilmList(isShuffle: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of Films'),
      ),
      body: Consumer<FilmViewModel>(
        builder: (context, filmViewModel, child) => Center(
          child: OrientationBuilder(
              builder: (BuildContext context, Orientation orientation) {
            if (filmViewModel.filmList.isNotEmpty) {
              if (orientation == Orientation.portrait) {
                return RefreshIndicator(
                  onRefresh: () async {
                    filmViewModel.getFilmList(isShuffle: true);
                  },
                  child: ListOfFilms(
                    list: filmViewModel.filmList,
                    onFilmSelected: (int index) {
                      Navigator.of(context).pushNamed(
                          Screen3Mvvm.detailsScreenRoute,
                          arguments: index);
                    },
                  ),
                );
              } else {
                return Landscape(
                  const Film('', ''),
                  ifSelected: false,
                  list: filmViewModel.filmList,
                  onFilmSelected: (int index) {
                    Navigator.of(context).pushNamed(
                        Screen3Mvvm.detailsScreenRoute,
                        arguments: index);
                  },
                );
              }
            } else {
              return loading();
            }
          }),
        ),
      ),
    );
  }
}
