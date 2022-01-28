import '../film.dart';

abstract class FilmEvent {}

class LoadFilmsEvent extends FilmEvent {
  LoadFilmsEvent(this.isShuffled);

  final bool isShuffled;
}

class SelectFilmEvent extends FilmEvent {
  SelectFilmEvent(this.selectedFilmId);

  final int selectedFilmId;
}
