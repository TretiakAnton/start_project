import 'package:start_project/film.dart';

abstract class FilmState {}

class FilmLoadingState extends FilmState {}

class FilmLoadedState extends FilmState {
  FilmLoadedState(
    this.films,
    this.selectedFilm,
    this.ifSelected,
  );

  final List<Film> films;
  final Film? selectedFilm;
  final bool ifSelected;
}
