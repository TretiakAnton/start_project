import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:start_project/repo/films%20_repo.dart';

import '../film.dart';

abstract class FilmGetter{}

class FilmState extends FilmGetter{
  late Future<List<Film>> list;
  getFilmFromRepo() async {
    FilmRepository repo;
     list = repo.getListOfFilms();
     return list;
  }
  getNull() {
    return null;
  }
}

enum State {init, getFilms}

class FilmBloc extends Bloc<State, FilmState> {
  FilmBloc(FilmState initialState ) : super(FilmState().getNull()) {
    on<State>((event, emit)  async {
      (event == State.init)?emit(await FilmState().getNull() ):emit( await FilmState().getFilmFromRepo());
    });
  }

}


