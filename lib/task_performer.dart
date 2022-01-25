import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:start_project/viewmodel/film_view_model.dart';

import 'bloc/bloc.dart';
import 'film.dart';

enum TaskPerformer { bloc, mvvm }

Perfoming(TaskPerformer taskPerformer, BuildContext context,
    FilmState filmState, FilmViewModel filmViewModel) {
  void flButton2Screen(taskPerformer) {
    if (taskPerformer == TaskPerformer.bloc) {
      BlocProvider.of<FilmBloc>(context).add(SelectFilmEvent(const Film(
        '',
        '',
      )));
    } else {
      filmViewModel.setFilm(const Film('', ''));
    }
  }
}
