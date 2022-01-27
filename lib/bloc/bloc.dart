import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:start_project/repo/films_repo.dart';

import '../film.dart';
import 'film_event.dart';
import 'film_state.dart';

export 'film_event.dart';
export 'film_state.dart';

class FilmBloc extends Bloc<FilmEvent, FilmState> {
  final FilmRepository _repo;

  FilmBloc(this._repo) : super(FilmLoadingState()) {
    on<LoadFilmsEvent>(_loadFilms);
    on<SelectFilmEvent>(_selectFilm);
  }

  void _selectFilm(SelectFilmEvent event, Emitter<FilmState> emit) {
    List<Film> films = List.empty();
    if (state is FilmLoadedState) {
      films = (state as FilmLoadedState).films;
    }
    emit(FilmLoadedState(films, event.selectedFilmId));
  }

  void _loadFilms(LoadFilmsEvent event, Emitter<FilmState> emit) async {
    final result = await _repo.getFilms();
    emit(FilmLoadedState(result, null));
  }
}

class BlocSecondScreen extends Bloc<FilmEvent, FilmState> {
  final FilmRepository _repo;

  BlocSecondScreen(this._repo) : super(FilmLoadingState()) {
    on<LoadFilmsEvent>(_loadFilms);
  }

  Future<void> _loadFilms(LoadFilmsEvent event, Emitter<FilmState> emit) async {
    final result = await _repo.getFilms();
    if (event.isShuffled) {
      result.shuffle();
    }
    emit(FilmLoadedState(result, null));
  }
}
