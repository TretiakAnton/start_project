import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';
import 'package:start_project/screens/screens.dart';
import 'package:start_project/screens/ui_tools/custom_widgets.dart';
import 'package:start_project/viewmodel/film_view_model.dart';

class ChooseScreenMvvm extends StatefulWidget {
  const ChooseScreenMvvm({Key? key}) : super(key: key);
  static const String detailsScreenRoute = 'screen2Mvvm';

  @override
  State<ChooseScreenMvvm> createState() => _ChooseScreenMvvmState();
}

class _ChooseScreenMvvmState extends State<ChooseScreenMvvm> {
  @override
  void initState() {
    super.initState();
    context.read<FilmViewModel>().getFilmList(isShuffle: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              backArrow(MediaQuery.of(context).orientation, context);
            }),
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
                    filmViewModel.filmList,
                    (int index) {
                      _onSelected(index, filmViewModel);
                    },
                    false,
                  ),
                );
              } else {
                return Landscape(
                  false,
                  filmViewModel.filmList,
                  (int index) {
                    _onSelected(index, filmViewModel);
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

  void _onSelected(int index, FilmViewModel filmViewModel) {
    Navigator.of(context)
        .pushNamed(DetailsScreenMvvm.detailsScreenRoute, arguments: index);
    filmViewModel.getSelectedFilm(index);
  }
}
