import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:start_project/bloc/bloc.dart';
import 'package:start_project/viewmodel/film_view_model.dart';

import '../task_performer.dart';
import 'screens.dart';

class Screen3 extends StatefulWidget {
  static const String detailsScreenRoute = 'screen3';
  final TaskPerformer taskPerformer;

  Screen3({Key? key, required this.taskPerformer}) : super(key: key);

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  @override
  Widget build(BuildContext context) {
    if (widget.taskPerformer == TaskPerformer.bloc) {
      return BlocBuilder<FilmBloc, FilmState>(builder: (_, filmState) {
        return _ui1Layer(
            context, widget.taskPerformer, filmState as FilmLoadedState);
      });
    } else {
      FilmViewModel filmViewModel = context.watch<FilmViewModel>();

      return _ui1Layer(context, widget.taskPerformer, null, filmViewModel);
    }
  }
}

_ui1Layer(BuildContext context, TaskPerformer taskPerformer,
    [FilmLoadedState? filmState, FilmViewModel? filmViewModel]) {
  return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: _ui2Layer(taskPerformer, filmState, filmViewModel),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.rotate_left),
          tooltip: 'rotate',
          onPressed: () {
            Navigator.of(context).pushNamed(Screen4.detailsScreenRoute,arguments: taskPerformer);
            SystemChrome.setPreferredOrientations([
              DeviceOrientation.landscapeLeft,
              DeviceOrientation.landscapeRight
            ]);
          }));
}

_ui2Layer(TaskPerformer taskPerformer,
    [FilmLoadedState? filmState, FilmViewModel? filmViewModel]) {
  if (filmState!.selectedFilm!.url.isNotEmpty ||
      filmViewModel!.film.url.isNotEmpty) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: _column(taskPerformer, filmState, filmViewModel),
      ),
    );
  } else {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

_column(TaskPerformer taskPerformer,
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
