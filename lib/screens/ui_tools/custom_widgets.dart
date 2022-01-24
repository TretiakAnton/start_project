import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:start_project/bloc/bloc.dart';
import 'package:start_project/viewmodel/film_view_model.dart';

import '../../task_performer.dart';

Widget title(TaskPerformer taskPerformer, int index,
    [FilmLoadedState? filmState, FilmViewModel? filmViewModel]) {
  if (taskPerformer == TaskPerformer.bloc) {
    return Text(filmState!.films[index].id);
  } else {
    return Text(filmViewModel!.filmList[index].id);
  }
}


Widget column(TaskPerformer taskPerformer,
    [FilmLoadedState? filmState, FilmViewModel? filmViewModel]) {
  if (taskPerformer == TaskPerformer.bloc) {
    return Column(
      children: [
        Text(filmState!.selectedFilm!.id),
        CachedNetworkImage(imageUrl: filmState.selectedFilm!.url)
      ],
    );
  } else {
    return Column(
      children: [
        Text(filmViewModel!.film.id),
        CachedNetworkImage(imageUrl: filmViewModel.film.url)
      ],
    );
  }
}
