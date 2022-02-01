import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:start_project/film.dart';
import 'package:start_project/repo/films_repo.dart';

import 'film_event.dart';
import 'film_state.dart';

export 'film_event.dart';
export 'film_state.dart';

class BlocThirdScreen extends Bloc<FilmEvent, FilmState> {
  BlocThirdScreen() : super(FilmLoadingState()) {
    on<SelectFilmEvent>(_initFilms);
  }

  void _initFilms(SelectFilmEvent event, Emitter<FilmState> emit) {
    final List<Film> films = event.films;
    final Film film = films[event.selectedFilmId];

    emit(FilmLoadedState(films, film));
  }
}

class BlocSecondScreen extends Bloc<FilmEvent, FilmState> {
  BlocSecondScreen(this._repo) : super(FilmLoadingState()) {
    on<LoadFilmsEvent>(_loadFilms);
  }

  final FilmRepository _repo;

  Future<void> _loadFilms(LoadFilmsEvent event, Emitter<FilmState> emit) async {
    final result = await _repo.getFilms();
    if (event.isShuffled) {
      result.shuffle();
    }
    emit(FilmLoadedState(result, null));
  }
}
