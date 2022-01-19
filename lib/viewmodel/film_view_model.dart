import 'package:flutter/material.dart';
import 'package:start_project/film.dart';
import 'package:start_project/repo/films_repo.dart';

class FilmViewModel extends ChangeNotifier {
  final FilmRepository _repo;

  bool _loading = false;
  List<Film> _filmList = [];
  late Film _film;

  bool get loading => _loading;

  List<Film> get filmList => _filmList;

  Film get film => _film;

  FilmViewModel(this._repo) {
    getFilmList();
  }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setFilmList(List<Film> filmList) {
    _filmList = filmList;
  }

  setFilm(Film film) {
    _film = film;
  }

  getFilmList() async {
    setLoading(true);
    var response = await _repo.getListOfFilms();
    if (response.isNotEmpty) {
      setFilmList(response);
    } else {
      //failure message
    }
    setLoading(false);
  }

  getSelectedFilm(Film film) {
    setLoading(true);
    setFilm(film);
    setLoading(false);
  }

  getShuffled() async {
    setLoading(true);
    filmList.shuffle();
    setLoading(false);
  }
}
