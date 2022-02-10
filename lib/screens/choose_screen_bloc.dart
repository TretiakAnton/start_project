import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:start_project/bloc/bloc.dart';
import 'package:start_project/film.dart';
import 'package:start_project/screens/screens.dart';
import 'package:start_project/screens/ui_tools/custom_widgets.dart';

class ChooseScreenBloc extends StatelessWidget{
  //widget
  const ChooseScreenBloc({Key? key}) : super(key: key);
  static const String chooseBlocScreenRoute = 'screen2Bloc';

  @override
  Widget build(BuildContext context) {
    final FilmBloc _bloc = BlocProvider.of<FilmBloc>(context);
    return Scaffold(
      appBar: AppBar(
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
                      onFilmSelected: (String film) {
                        _bloc.add(SelectFilmEvent(selectedFilm: film));
                      },

                      enableSelection: false,
                    ),
                  );
                } else {
                  return Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: ListOfFilms(
                          list: filmState.films,
                          onFilmSelected: (String id) {
                            _bloc.add(SelectFilmEvent(selectedFilm: id));
                          },
                          enableSelection: true,
                          selectedFilm: filmState.selectedFilm!.id,
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

  void _pushDetailsScreen(Film film, BuildContext context) {
    Navigator.of(context).pushNamed(
      DetailsScreen.detailsScreenRoute,
      arguments: DetailsScreenArguments(
        film: film,
        onExitPageCallback: () {
          //_bloc.add(SelectFilmEvent(selectedFilm: const Film('', '')));
        },
      ),
    );
  }
}

mixin BlocNavigator{
  void push (String name, Object? arguments);
}