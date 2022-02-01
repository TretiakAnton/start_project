import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:start_project/screens/ui_tools/custom_widgets.dart';
import 'package:start_project/viewmodel/film_view_model.dart';

class DetailsScreenMvvm extends StatefulWidget {
  final int selectedFilmId;
  static const String detailsScreenRoute = 'detailsMvvm';

  DetailsScreenMvvm({Key? key, required this.selectedFilmId}) : super(key: key);

  @override
  State<DetailsScreenMvvm> createState() => _DetailsScreenMvvmState();
}

class _DetailsScreenMvvmState extends State<DetailsScreenMvvm> {
  @override
  void initState() {
    super.initState();
    context.read<FilmViewModel>();
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
        title: const Text('Details'),
      ),
      body: Consumer<FilmViewModel>(
        builder: (context, filmViewModel, child) => Center(
          child: OrientationBuilder(
            builder: (BuildContext context, Orientation orientation) {
              if (filmViewModel.film.id.isNotEmpty) {
                if (orientation == Orientation.portrait) {
                  return Details(film: filmViewModel.film);
                } else {
                  return Landscape(
                    filmViewModel.film,
                    ifSelected: true,
                    list: filmViewModel.filmList,
                    onFilmSelected: (int index) {
                      filmViewModel.getSelectedFilm(index);
                    },
                  );
                }
              } else {
                return loading();
              }
            },
          ),
        ),
      ),
    );
  }
}
