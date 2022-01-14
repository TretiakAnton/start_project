import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:start_project/film.dart';
import 'package:start_project/repo/films_repo.dart';

class FilmViewModel extends ChangeNotifier {
  final FilmRepository _repo;

  bool _loading = false;
  bool _loadingLandscape = false;
  List<Film> _filmList = [];
  late Film _film;
  Orientation _orientation = Orientation.portrait;

  bool get loading => _loading;

  bool get loadingLandscape => _loadingLandscape;

  List<Film> get filmList => _filmList;

  Film get film => _film;

  Orientation get orientation => _orientation;

  FilmViewModel(this._repo) {
    getFilmList();
  }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setLoadingLandscape(bool loadingLandscape) async {
    _loadingLandscape = loadingLandscape;
    notifyListeners();
  }

  setFilmList(List<Film> filmList) {
    _filmList = filmList;
  }

  setFilm(Film film) {
    _film = film;
  }

  setOrientationPortrait() async {
    setLoading(true);
    await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    setLoading(false);
  }

  setOrientationLandscape() async {
    setLoading(true);
    await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    setLoading(false);
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
}
