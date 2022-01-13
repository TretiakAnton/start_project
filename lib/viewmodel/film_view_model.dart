import 'package:flutter/material.dart';
import 'package:start_project/repo/films_repo.dart';

import '../film.dart';

class FilmViewModel extends ChangeNotifier {
  bool _loading = false;
  List<Film> _filmList = [];

  bool get loading => _loading;
  List<Film> get listFilms => _filmList;

  FilmViewModel(){
    getFilms();
    print('get films loaded');
  }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setFilmList(List<Film> filmList) {
    _filmList = filmList;
  }

  getFilms() async {
    setLoading(true);
    var response = await FilmRepository().getListOfFilms();
    if (response.isNotEmpty) {
      setFilmList(response);
    } else {
      //failure message
    }
    setLoading(false);
  }
}
