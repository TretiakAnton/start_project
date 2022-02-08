import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:start_project/bloc/bloc.dart';
import 'package:start_project/film.dart';
import 'package:start_project/screens/ui_tools/custom_widgets.dart';

class DetailsBlocScreen extends StatelessWidget {
  const DetailsBlocScreen(
      {Key? key, required this.callback})
      : super(key: key);

  final Function(int) callback;
  static const String detailsScreenRoute = 'detailsBloc';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              callback(1);
              Navigator.of(context).pop();
            }),
        title: const Text('Details'),
      ),
      body: Center(
        child: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            return BlocBuilder<FilmBloc, FilmState>(builder: (_, filmState) {
              if (filmState is FilmLoadedState) {
                if (orientation == Orientation.portrait) {
                  return Details(film: filmState.selectedFilm);
                } else {
                  BlocProvider.of<FilmBloc>(context)
                      .add(SelectFilmEvent(selectedFilm: const Film('', '')));
                  Navigator.of(context).pop();
                  return const CircularProgressIndicator();
                }
              } else {
                return const CircularProgressIndicator();
              }
            });
          },
        ),
      ),
    );
  }
}
