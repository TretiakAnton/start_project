import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:start_project/bloc/bloc.dart';
import 'package:start_project/repo/films_repo.dart';
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
              onPressed: () {
                backArrow(MediaQuery.of(context).orientation, context);
              }),
          title: const Text('List of Films'),
        ),
        body: BlocProvider<FilmBloc>(
          create: (context) =>
              FilmBloc(FilmRepository())..add(LoadFilmsEvent(false)),
          child: OrientationBuilder(
              builder: (BuildContext context, Orientation orientation) {
            return BlocBuilder<FilmBloc, FilmState>(builder: (_, filmState) {
              if (filmState is FilmLoadedState) {
                if (orientation == Orientation.portrait) {
                  return RefreshIndicator(
                    onRefresh: () async {
                      BlocProvider.of<FilmBloc>(context)
                          .add(LoadFilmsEvent(true));
                    },
                    child: ListOfFilms(
                      filmState.films,
                      (int index) {
                        BlocProvider.of<FilmBloc>(context)
                            .add(SelectFilmEvent(selectedFilmId: index));
                        Navigator.of(context).pushNamed(
                            DetailsScreen.detailsScreenRoute,
                            arguments: filmState.selectedFilm);
                      },
                      false,
                    ),
                  );
                } else {
                  return Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: ListOfFilms(
                            filmState.films,
                            (int index) {
                              BlocProvider.of<FilmBloc>(context)
                                  .add(SelectFilmEvent(selectedFilmId: index));
                            },
                            true,
                            filmState.selectedFilm,
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
        ));
  }
}
