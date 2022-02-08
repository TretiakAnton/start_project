import 'package:flutter/material.dart';
import 'package:start_project/film.dart';
import 'package:start_project/repo/films_repo.dart';

class FilmViewModel extends ChangeNotifier {
  FilmViewModel(this._repo);

  final FilmRepository _repo;

  List<Film> _filmList = [];
  Film _film = const Film('', '');

  List<Film> get filmList => _filmList;

  Film get film => _film;


  Future<void> getFilmList({required bool isShuffle}) async {
    _filmList = await _repo.getFilms();
    if (isShuffle) {
      _filmList.shuffle();
    }
    notifyListeners();
  }

  void setSelectedFilm(Film selectedFilm) {
    _film = selectedFilm;
    notifyListeners();
  }


}
