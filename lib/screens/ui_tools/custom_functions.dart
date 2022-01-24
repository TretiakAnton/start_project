import 'package:start_project/bloc/film_state.dart';
import 'package:start_project/viewmodel/film_view_model.dart';

import '../../task_performer.dart';

bool selected(TaskPerformer taskPerformer, int index,
    [FilmLoadedState? filmState, FilmViewModel? filmViewModel]) {
  if (taskPerformer == TaskPerformer.bloc) {
    return filmState?.films[index] == filmState?.selectedFilm;
  } else {
    return filmViewModel?.filmList[index] == filmViewModel?.film;
  }
}

int? count(TaskPerformer taskPerformer,
    [FilmLoadedState? filmState, FilmViewModel? filmViewModel]) {
  if (taskPerformer == TaskPerformer.bloc) {
    return filmState?.films.length;
  } else {
    return filmViewModel?.filmList.length;
  }
}