import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:start_project/repo/films_repo.dart';

import 'film_event.dart';
import 'film_state.dart';
import '../film.dart';
export 'film_state.dart';
export 'film_event.dart';

class FilmBloc extends Bloc<FilmEvent, FilmState> {
  final FilmRepository _repo;

  FilmBloc(this._repo) : super(FilmLoadingState()) {
    on<LoadFilmsEvent>(_loadFilms);
    on<SelectFilmEvent>(_selectFilm);
    on<ShuffleFilmEvent>(_pullToRefreshFilms);
  }

  void _selectFilm(SelectFilmEvent event, Emitter<FilmState> emit) async {
    List<Film> films = List.empty();
    if (state is FilmLoadedState) {
      films = (state as FilmLoadedState).films;
    }
    emit(FilmLoadedState(films, event.selectedFilmId));
  }

  void _loadFilms(LoadFilmsEvent event, Emitter<FilmState> emit) async {
    final result = await _repo.getListOfFilms();
    emit(FilmLoadedState(result, null));
  }

  void _pullToRefreshFilms(
      ShuffleFilmEvent event, Emitter<FilmState> emit) async {
    List<Film> films = List.empty();
    films = await _repo.getListOfFilms();
    /* if (state is FilmLoadedState) {
      films = (state as FilmLoadedState).films;
    }*/
    films.shuffle();
    emit(FilmLoadedState(films, null));
  }
}
