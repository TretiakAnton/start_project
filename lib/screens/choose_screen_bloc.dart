import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:start_project/bloc/bloc.dart';
import 'package:start_project/film.dart';
import 'package:start_project/screens/screens.dart';
import 'package:start_project/screens/ui_tools/custom_widgets.dart';

class ChooseScreenBloc extends StatefulWidget {
  const ChooseScreenBloc({Key? key}) : super(key: key);
  static const String detailsScreenRoute = 'screen2Bloc';

  @override
  State<ChooseScreenBloc> createState() => _ChooseScreenBlocState();
}

class _ChooseScreenBlocState extends State<ChooseScreenBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () { backArrow(MediaQuery.of(context).orientation, context);
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
                  onFilmSelected: (int index) {//meth_
                    Navigator.of(context).pushNamed(
                        DetailsScreenBloc.detailsScreenRoute,
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
                      DetailsScreenBloc.detailsScreenRoute,
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
