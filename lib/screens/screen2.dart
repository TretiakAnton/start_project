import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:start_project/bloc/bloc.dart';
import 'package:start_project/film.dart';
import 'package:start_project/screens/screens.dart';
import 'package:start_project/screens/ui_tools/custom_functions.dart';
import 'package:start_project/screens/ui_tools/custom_widgets.dart';
import 'package:start_project/viewmodel/film_view_model.dart';

import '../task_performer.dart';

class Screen2 extends StatefulWidget {
  static const String detailsScreenRoute = 'screen2';
  final TaskPerformer taskPerformer;

  Screen2({Key? key, required this.taskPerformer}) : super(key: key);

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of Films'),
      ),
      body: Center(child: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            if (orientation == Orientation.portrait) {
              if (widget.taskPerformer == TaskPerformer.bloc) {
                return _ui2BlocPart(context);
              } else {
                return _ui2MvvmPart(context);
              }
            } else {
              Navigator.of(context).pushNamed(Screen4.detailsScreenRoute);
            }
          })),
    );
  }

  Widget _ui2MvvmPart(BuildContext context) {
    final FilmViewModel filmViewModel = context.watch<FilmViewModel>();
    return RefreshIndicator(
        onRefresh: () async {
          filmViewModel.getFilmList(isShuffle: true);
        },
        child: _ui3MvvmPart(context, filmViewModel));
  }
}

Widget _ui2BlocPart(BuildContext context) {
  return BlocBuilder<FilmBloc, FilmState>(builder: (_, filmState) {
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<FilmBloc>(context).add(ShuffleFilmEvent());

        // filmViewModel?.getFilmList(isShuffle: true);
      },
      child: _ui3BlocPart(context, filmState),);
  }
  );
}

Widget _ui3MvvmPart(BuildContext context, FilmViewModel filmViewModel) {

}

Widget _ui3BlocPart(BuildContext context, FilmState? filmState) {
  if (filmViewModel?.filmList.isNotEmpty ?? filmState != null) {
    return ListView.builder(
        itemCount: count(taskPerformer, filmState, filmViewModel),
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                Navigator.of(context).pushNamed(Screen3.detailsScreenRoute,
                    arguments: taskPerformer);
                if (taskPerformer == TaskPerformer.bloc &&
                    filmState is FilmLoadedState) {
                  BlocProvider.of<FilmBloc>(context)
                      .add(SelectFilmEvent(filmState.films[index]));
                } else {
                  filmViewModel
                      ?.getSelectedFilm(filmViewModel.filmList[index]);
                }
              },
              title: title(taskPerformer, index, filmState, filmViewModel),
            ),
          );
        });
  } else {
    return loading();
  }
}}
