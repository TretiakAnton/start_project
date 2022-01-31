import 'package:flutter/material.dart';
import 'package:start_project/film.dart';
import 'package:start_project/repo/films_repo.dart';

class FilmViewModel extends ChangeNotifier {
  final FilmRepository _repo;

  List<Film> _filmList = [];
  late Film _film;

  List<Film> get filmList => _filmList;

  Film get film => _film;

  FilmViewModel(this._repo) {
    getFilmList(isShuffle: false);
  }

  Future<void> getFilmList({required bool isShuffle}) async {
    _filmList = await _repo.getFilms();
    if (isShuffle) {
      filmList.shuffle();
    }
  }

  void getSelectedFilm(int index) {
    _film = filmList[index];
  }
}
