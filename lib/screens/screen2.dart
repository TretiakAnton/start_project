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
    if (widget.taskPerformer == TaskPerformer.bloc) {
      return BlocBuilder<FilmBloc, FilmState>(builder: (_, filmState) {
        return _ui1Layer(context, widget.taskPerformer, filmState, null);
      });
    } else {
      FilmViewModel filmViewModel = context.watch<FilmViewModel>();

      return _ui1Layer(context, widget.taskPerformer, null, filmViewModel);
    }
  }
}

Widget _ui1Layer(BuildContext context, TaskPerformer taskPerformer,
    [FilmState? filmState, FilmViewModel? filmViewModel]) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('List of Films'),
    ),
    body: _ui2Layer(context, taskPerformer, filmState, filmViewModel),
    floatingActionButton: FloatingActionButton(
      child: const Icon(Icons.rotate_left),
      tooltip: 'rotate',
      onPressed: () {
        Navigator.of(context)
            .pushNamed(Screen4.detailsScreenRoute, arguments: taskPerformer);
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight
        ]);
        if (taskPerformer == TaskPerformer.bloc) {
          BlocProvider.of<FilmBloc>(context).add(SelectFilmEvent(const Film(
            '',
            '',
          )));
        } else {
          filmViewModel?.setFilm(const Film('', ''));
        }
      },
    ),
  );
}

Widget _ui2Layer(BuildContext context, TaskPerformer taskPerformer,
    [FilmState? filmState, FilmViewModel? filmViewModel]) {
  return RefreshIndicator(
      onRefresh: () async {
        if (taskPerformer == TaskPerformer.bloc) {
          BlocProvider.of<FilmBloc>(context).add(ShuffleFilmEvent());
        } else {
          filmViewModel?.getPullToRefresh();
        }
      },
      child: _ui3Layer(context, taskPerformer, filmState, filmViewModel));
}

Widget _ui3Layer(BuildContext context, TaskPerformer taskPerformer,
    [FilmState? filmState, FilmViewModel? filmViewModel]) {
  if (filmViewModel?.filmList.isNotEmpty ??
      filmState is FilmLoadedState && filmState.films.isNotEmpty) {
    return ListView.builder(
        itemCount: count(taskPerformer, filmState as FilmLoadedState, filmViewModel),
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                Navigator.of(context).pushNamed(Screen3.detailsScreenRoute,
                    arguments: taskPerformer);
                if (taskPerformer == TaskPerformer.bloc) {
                  BlocProvider.of<FilmBloc>(context)
                      .add(SelectFilmEvent(filmState.films[index]));
                } else {
                  filmViewModel?.getSelectedFilm(filmViewModel.filmList[index]);
                }
              },
              title: title(taskPerformer, index, filmState, filmViewModel),
            ),
          );
        });
  } else {
    return const Center(child: CircularProgressIndicator());
  }
}
