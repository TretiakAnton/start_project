import '../film.dart';

abstract class FilmState {}

class FilmLoadingState extends FilmState {
}

class FilmLoadedState extends FilmState {
  final List<Film> films;
  final Film? selectedFilm;

  FilmLoadedState(
      this.films,
      this.selectedFilm,
      );
}

class SelectedFilm extends FilmState {
  final Film? selectedFilm;

  SelectedFilm(this.selectedFilm);
}