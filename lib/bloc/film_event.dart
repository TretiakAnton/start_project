import '../film.dart';

abstract class FilmEvent {}

class LoadFilmsEvent extends FilmEvent {}

class SelectFilmEvent extends FilmEvent {
  final Film selectedFilmId;

  SelectFilmEvent(this.selectedFilmId);
}

class ShuffleFilmEvent extends FilmEvent{}