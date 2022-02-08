import 'package:start_project/film.dart';

abstract class FilmEvent {}

class LoadFilmsEvent extends FilmEvent {
  LoadFilmsEvent(this.isShuffled);

  final bool isShuffled;
}

class SelectFilmEvent extends FilmEvent {
  SelectFilmEvent({required this.selectedFilm});

  final Film selectedFilm;
}


