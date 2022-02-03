import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:start_project/bloc/film_details_bloc.dart';
import 'package:start_project/bloc/film_list_bloc.dart';
import 'package:start_project/film.dart';
import 'package:start_project/screens/screens.dart';
import 'package:start_project/screens/ui_tools/custom_widgets.dart';

class ChooseScreenBloc extends StatelessWidget {
  const ChooseScreenBloc({Key? key}) : super(key: key);
  static const String detailsScreenRoute = 'screen2Bloc';

  @override
  Widget build(BuildContext context) {
    final _filmBloc = context.read<FilmBloc>();
    final _filmDetailsBloc = context.read<FilmDetailsBloc>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              backArrow(MediaQuery.of(context).orientation, context);
            }),
        title: const Text('List of Films'),
      ),
      body: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          if (orientation == Orientation.portrait) {
            return StreamBuilder<List<Film>>(
              stream: _filmBloc.filmStream,
              builder: (_, dataSnaphot) => ListOfFilms(
                list: dataSnaphot.data ?? [],
                onFilmSelected: (film) {
                  _filmDetailsBloc.setFilmId(film);
                  Navigator.of(context).pushNamed(
                    DetailsScreen.detailsScreenRoute,
                    arguments: DetailsScreenArgumets(
                        film, _filmDetailsBloc.clearSelected),
                  );
                },
                onRefresh: _filmBloc.refreshData,
              ),
            );
          } else {
            return Row(
              children: [
                Expanded(
                  flex: 1,
                  child: StreamBuilder<List<Film>>(
                    stream: _filmBloc.filmStream,
                    builder: (_, dataSnaphot) => ListOfFilms(
                      list: dataSnaphot.data ?? [],
                      onFilmSelected: (film) =>
                          _filmDetailsBloc.setFilmId(film),
                      onRefresh: _filmBloc.refreshData,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: StreamBuilder<FilmDetailsState>(
                    stream: _filmDetailsBloc.filmStream,
                    builder: (context, snapshot) =>
                        Details(film: snapshot.data?.film),
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
}
