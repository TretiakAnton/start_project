import 'package:flutter/material.dart';
import 'package:start_project/film.dart';
import 'package:start_project/repo/films_repo.dart';

class FilmViewModel extends ChangeNotifier {
  FilmViewModel(this._repo);

  final FilmRepository _repo;

  List<Film> _filmList = [];
  Film _film = const Film('', '');
  bool _ifSelected  = false;

  List<Film> get filmList => _filmList;

  Film get film => _film;

  bool get ifSelected => _ifSelected;

  Future<void> getFilmList({required bool isShuffle}) async {
    _filmList = await _repo.getFilms();
    if (isShuffle) {
      _filmList.shuffle();
    }
    notifyListeners();
  }
  //TODO use prefix 'set' for setters
  void getSelectedFilm(Film selectedFilm) {
    _film = selectedFilm;
    notifyListeners();
  }

  void setSelected({required bool ifSelected}){
    _ifSelected = ifSelected;
  }
}
