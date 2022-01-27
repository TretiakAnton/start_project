import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:start_project/bloc/bloc.dart';
import 'package:start_project/film.dart';
import 'package:start_project/viewmodel/film_view_model.dart';

import '../../task_performer.dart';


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

Widget listOfFilms(String screenRoute, List<Film> list) {
  return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            onTap: () {
              Navigator.of(context).pushNamed(screenRoute, arguments: index);
            },
            title: Text(list[index].id),
          ),
        );
      });
}

Widget landscape([int? selectedIndex]) {
  return
}