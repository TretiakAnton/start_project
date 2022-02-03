import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:start_project/film.dart';
import 'package:start_project/repo/films_repo.dart';

class FilmBloc {
  FilmBloc(this._repo) {
    loadFilms();
  }

  final FilmRepository _repo;
  List<Film> _cachedFilms = List.empty();
  final _filmsController = BehaviorSubject<List<Film>>();
  ValueStream<List<Film>> get filmStream => _filmsController;

  Future<void> loadFilms() async {
    _cachedFilms = await _repo.getFilms();
    _filmsController.add(_cachedFilms);
  }

  Future<Film> getFilmById(String id) async => _repo
      .getFilms()
      .then((value) => value.firstWhere((element) => element.id == id));

  Future<void> refreshData() async {
    _cachedFilms.shuffle();
    _filmsController.add(_cachedFilms);
  }
}
