import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:start_project/film.dart';
import 'package:start_project/repo/films_repo.dart';

import 'film_event.dart';
import 'film_state.dart';

export 'film_event.dart';
export 'film_state.dart';

class FilmBloc extends Bloc<FilmEvent, FilmState> {
  FilmBloc(this._repo) : super(FilmLoadingState()) {
    on<SelectFilmEvent>(_selectFilm);
    on<LoadFilmsEvent>(_loadFilms);
  }

  final FilmRepository _repo;

  void _selectFilm(SelectFilmEvent event, Emitter<FilmState> emit) {
    List<Film> list = List.empty();
    if (state is FilmLoadedState) {
      list = (state as FilmLoadedState).films;
    }
    final Film film = list[event.selectedFilmId];

    emit(FilmLoadedState(list, film));
  }

  Future<void> _loadFilms(LoadFilmsEvent event, Emitter<FilmState> emit) async {
    final result = await _repo.getFilms();
    if (event.isShuffled) {
      result.shuffle();
    }
    emit(FilmLoadedState(result, null));
  }
}
