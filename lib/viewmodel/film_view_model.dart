import 'package:flutter/material.dart';
import 'package:start_project/film.dart';
import 'package:start_project/repo/films_repo.dart';

class FilmViewModel extends ChangeNotifier {
  FilmViewModel(this._repo);

  final FilmRepository _repo;

  List<Film> _filmList=[];
  late Film _film;

  List<Film> get filmList => _filmList;

  Film get film => _film;

  Future<void> getFilmList({required bool isShuffle}) async {
    //_filmList.clear();
    _filmList = await _repo.getFilms();
    print('repo');
    if (isShuffle) {
      _filmList.shuffle();
    }
    notifyListeners();
    print('notify');
  }

  void getSelectedFilm(int index) {
    _film = filmList[index];
    notifyListeners();
  }
}
