import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:start_project/bloc/bloc.dart';
import 'package:start_project/film.dart';
import 'package:start_project/screens/ui_tools/custom_widgets.dart';

class DetailsScreenBloc extends StatefulWidget {
  const DetailsScreenBloc(
      {Key? key, required this.selectedFilm, required this.films})
      : super(key: key);
  final List<Film> films;
  final int selectedFilm;
  static const String detailsScreenRoute = 'detailsBloc';

  @override
  State<DetailsScreenBloc> createState() => _DetailsScreenBlocState();
}

class _DetailsScreenBlocState extends State<DetailsScreenBloc> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<BlocThirdScreen>(context).add(SelectFilmEvent(
      films: widget.films,
      selectedFilmId: widget.selectedFilm,
    )); //to rout generator
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
        title: const Text('Details'),
      ),
      body: Center(
        child: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            return BlocBuilder<BlocThirdScreen, FilmState>(
                builder: (_, filmState) {
              if (filmState is FilmLoadedState) {
                if (orientation == Orientation.portrait) {
                  return Details(film: filmState.selectedFilm);
                } else {
                  return Landscape(
                    filmState.selectedFilm,
                    ifSelected: true,
                    list: filmState.films,
                    onFilmSelected: (int index) {
                      BlocProvider.of<BlocThirdScreen>(context).add(
                          SelectFilmEvent(
                              films: filmState.films, selectedFilmId: index));
                    },
                  );
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
