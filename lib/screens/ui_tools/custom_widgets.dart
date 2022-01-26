import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:start_project/bloc/bloc.dart';
import 'package:start_project/viewmodel/film_view_model.dart';

import '../../task_performer.dart';

Widget title(TaskPerformer taskPerformer, int index,
    [FilmState? filmState, FilmViewModel? filmViewModel]) {
  if (taskPerformer == TaskPerformer.bloc && filmState is FilmLoadedState) {
    return Text(filmState.films[index].id);
  } else if (taskPerformer == TaskPerformer.mvvm) {
    return Text(filmViewModel!.filmList[index].id);
  } else {
    return loading();
  }
}

Widget column(TaskPerformer taskPerformer,
    [FilmState? filmState, FilmViewModel? filmViewModel]) {
  if (taskPerformer == TaskPerformer.bloc && filmState is FilmLoadedState) {
    return Column(
      children: [
        Text(filmState.selectedFilm!.id),
        CachedNetworkImage(imageUrl: filmState.selectedFilm!.url)
      ],
    );
  } else if (taskPerformer == TaskPerformer.mvvm) {
    return Column(
      children: [
        Text(filmViewModel!.film.id),
        CachedNetworkImage(imageUrl: filmViewModel.film.url)
      ],
    );
  } else {
    return loading();
  }
}

Widget loading() {
  return const Center(child: CircularProgressIndicator());
}
