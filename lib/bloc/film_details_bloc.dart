import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:start_project/film.dart';

class FilmDetailsState {
  FilmDetailsState(this.film);

  final Film? film;
}

class FilmDetailsBloc {
  FilmDetailsBloc();

  final _filmsController = BehaviorSubject<FilmDetailsState>();
  ValueStream<FilmDetailsState> get filmStream => _filmsController;

  Future<void> setFilmId(Film film) async {
    _filmsController.add(FilmDetailsState(film));
  }

  void clearSelected() => _filmsController.add(FilmDetailsState(null));
}
