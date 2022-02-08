import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:start_project/bloc/bloc.dart';
import 'package:start_project/film.dart';
import 'package:start_project/screens/screens.dart';
import 'package:start_project/screens/ui_tools/custom_widgets.dart';

class ChooseScreenBloc extends StatelessWidget {
  const ChooseScreenBloc({Key? key}) : super(key: key);
  static const String chooseBlocScreenRoute = 'screen2Bloc';

  @override
  Widget build(BuildContext context) {
    final FilmBloc _bloc = BlocProvider.of<FilmBloc>(context);
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
          return BlocBuilder<FilmBloc, FilmState>(
            builder: (_, filmState) {
              if (filmState is FilmLoadedState) {
                if (orientation == Orientation.portrait) {
                  return RefreshIndicator(
                    onRefresh: () async {
                      _bloc.add(LoadFilmsEvent(true));
                    },
                    child: ListOfFilms(
                      list: filmState.films,
                      onFilmSelected: (Film film) {
                        _bloc.add(SelectFilmEvent(selectedFilm: film));
                        Navigator.of(context).pushNamed(
                          DetailsScreen.detailsScreenRoute,
                          arguments: DetailsScreenArguments(
                            film: film,
                            callback: () {
                              _bloc.add(SelectFilmEvent(
                                  selectedFilm: const Film('', '')));
                            },
                          ),
                        );
                      },
                      isSelected: false,
                    ),
                  );
                } else {
                  return Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: ListOfFilms(
                          list: filmState.films,
                          onFilmSelected: (Film film) {
                            _bloc.add(SelectFilmEvent(selectedFilm: film));
                          },
                          isSelected: true,
                          selectedFilm: filmState.selectedFilm,
                        ),
                      ),
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
            },
          );
        },
      ),
    );
  }
}
