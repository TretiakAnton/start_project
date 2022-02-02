abstract class FilmEvent {}

class LoadFilmsEvent extends FilmEvent {
  LoadFilmsEvent(this.isShuffled);

  final bool isShuffled;
}

class SelectFilmEvent extends FilmEvent {
  SelectFilmEvent({required this.selectedFilmId});

  final int selectedFilmId;
}
