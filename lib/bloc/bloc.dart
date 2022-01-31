import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:start_project/repo/films_repo.dart';

import '../film.dart';
import 'film_event.dart';
import 'film_state.dart';

export 'film_event.dart';
export 'film_state.dart';

class BlocThirdScreen extends Bloc<FilmEvent, FilmState> {

  BlocThirdScreen() : super(FilmLoadingState()) {
    on<SelectFilmEvent>(_selectFilmOnIndex);
  }

  void _selectFilmOnIndex(SelectFilmEvent event, Emitter<FilmState> emit) {
    List<Film> films = List.empty();
    if (state is FilmLoadedState) {
      films = (state as FilmLoadedState).films;
    }
    emit(FilmLoadedState(films, films[event.selectedFilmId]));
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
