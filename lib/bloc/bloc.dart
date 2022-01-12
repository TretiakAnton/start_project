import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:start_project/repo/films%20_repo.dart';

import '../film.dart';

abstract class FilmGetter{}

class FilmState extends FilmGetter{
  late Future<List<Film>> list;
  getFilmFromRepo() async {
    FilmRepository repo;
     list = repo.getListOfFilms();
  }
}

enum State {init, getFilms}

class FilmBloc extends Bloc<State, FilmState> {
  FilmBloc() : super(null) {
    on<State>((event, emit)  {
      (event == State.init)?emit(null):emit(FilmState().getFilmFromRepo());
    });
  }

}


