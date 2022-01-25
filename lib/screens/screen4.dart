import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:start_project/bloc/bloc.dart';
import 'package:start_project/viewmodel/film_view_model.dart';

import '../film.dart';
import '../task_performer.dart';
import 'ui_tools/custom_functions.dart';
import 'ui_tools/custom_widgets.dart';

class Screen4 extends StatefulWidget {
  static const String detailsScreenRoute = 'screen4';
  final TaskPerformer taskPerformer;

  Screen4({Key? key, required this.taskPerformer}) : super(key: key);

  @override
  State<Screen4> createState() => _Screen4State();
}

class _Screen4State extends State<Screen4> {
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
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          if (taskPerformer == TaskPerformer.bloc) {
            BlocProvider.of<FilmBloc>(context).add(SelectFilmEvent(const Film(
              '',
              '',
            )));
          } else {
            filmViewModel?.setFilm(const Film('', ''));
          }
          SystemChrome.setPreferredOrientations(
              [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
          Navigator.of(context).popUntil((route) => route.isFirst);
        },
      ),
      title: const Text('Landscape Screen'),
    ),
    body: _ui2Layer(taskPerformer, filmState, filmViewModel),
    floatingActionButton: FloatingActionButton(
      child: const Icon(Icons.rotate_left),
      tooltip: 'rotate',
      onPressed: () {
        Navigator.of(context).pop();
        SystemChrome.setPreferredOrientations(
            [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
      },
    ),
  );
}

Widget _ui2Layer(TaskPerformer taskPerformer,
    [FilmState? filmState, FilmViewModel? filmViewModel]) {
  return Row(
    children: [
      Expanded(
        flex: 1,
        child: ListView.builder(
            itemCount: count(taskPerformer, filmState, filmViewModel),
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  selected:
                      selected(taskPerformer, index, filmState, filmViewModel),
                  onTap: () {
                    if (taskPerformer == TaskPerformer.bloc &&
                        filmState is FilmLoadedState) {
                      BlocProvider.of<FilmBloc>(context)
                          .add(SelectFilmEvent(filmState.films[index]));
                    } else {
                      filmViewModel?.getSelectedFilm(
                          filmViewModel.filmList.elementAt(index));
                    }
                  },
                  title: title(taskPerformer, index, filmState, filmViewModel),
                ),
              );
            }),
      ),
      Expanded(
        flex: 2,
        child: _ui3Layer(taskPerformer, filmState, filmViewModel),
      )
    ],
  );
}

Widget _ui3Layer(TaskPerformer taskPerformer,
    [FilmState? filmState, FilmViewModel? filmViewModel]) {
  if (filmViewModel?.film.url.isNotEmpty ?? filmState != null) {
    return SingleChildScrollView(
        child: column(taskPerformer, filmState, filmViewModel));
  } else {
    return Column(children: const [
      Text('Waiting for you to choose film'),
      CircularProgressIndicator(),
    ]);
  }
}
