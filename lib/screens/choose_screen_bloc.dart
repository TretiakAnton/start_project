import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:start_project/bloc/bloc.dart';
import 'package:start_project/film.dart';
import 'package:start_project/screens/screens.dart';
import 'package:start_project/screens/ui_tools/custom_widgets.dart';

class ChooseScreenBloc extends StatelessWidget {
  const ChooseScreenBloc({Key? key}) : super(key: key);
  static const String detailsScreenRoute = 'screen2Bloc';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            }),
        title: const Text('List of Films'),
      ),
      body: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
        return BlocBuilder<FilmBloc, FilmState>(builder: (_, filmState) {
          if (filmState is FilmLoadedState) {
            if (orientation == Orientation.portrait) {
              return RefreshIndicator(
                onRefresh: () async {
                  BlocProvider.of<FilmBloc>(context).add(LoadFilmsEvent(true));
                },
                child: ListOfFilms(
                  list: filmState.films,
                  onFilmSelected: (Film film) {
                    BlocProvider.of<FilmBloc>(context)
                        .add(SelectFilmEvent(selectedFilm: film));
                    Navigator.of(context).pushNamed(
                        DetailsBlocScreen.detailsScreenRoute,
                        arguments: {
                          'callback': (int callback) {
                            BlocProvider.of<FilmBloc>(context).add(
                                SelectFilmEvent(
                                    selectedFilm: const Film('', '')));
                          },
                          'film': film
                        });
                  },
                  isSelected: false,
                ),
              );
            } else {
              if (!filmState.ifSelected) {
                BlocProvider.of<FilmBloc>(context)
                    .add(SelectFilmEvent(selectedFilm: const Film('', '')));
              }
              return Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: ListOfFilms(
                        list: filmState.films,
                        onFilmSelected: (Film film) {
                          BlocProvider.of<FilmBloc>(context)
                              .add(SelectFilmEvent(selectedFilm: film));
                        },
                        isSelected: true,
                        selectedFilm: filmState.selectedFilm,
                      )),
                  Expanded(
                    flex: 2,
                    child: Details(
                      film: filmState.selectedFilm,
                    ),
                  )
                ],
              );
            }
          } else {
            return loading();
          }
        });
      }),
    );
  }
}
