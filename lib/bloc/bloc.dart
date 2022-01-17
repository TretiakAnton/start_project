import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:start_project/repo/films_repo.dart';

import '../film.dart';

abstract class FilmEvent {}

class LoadFilmsEvent extends FilmEvent {}

class SelectFilmEvent extends FilmEvent {
  final Film selectedFilmId;

  SelectFilmEvent(this.selectedFilmId);
}

class SetInitFilm extends SelectFilmEvent {
  SetInitFilm(Film selectedFilmId) : super(selectedFilmId);
}

abstract class FilmState {}

class FilmLoadingState extends FilmState {
  late bool loading;
}

class FilmLoadedState extends FilmState {
  final List<Film> films;
  final Film? selectedFilm;

  FilmLoadedState(this.films, this.selectedFilm, );
}

class SelectedFilm extends FilmState {
  final Film? selectedFilm;

  SelectedFilm(this.selectedFilm);
}

class FilmBloc extends Bloc<FilmEvent, FilmState> {
  final FilmRepository _repo;

  FilmBloc(this._repo) : super(FilmLoadingState()) {
    on<LoadFilmsEvent>(_loadFilms);
    on<SelectFilmEvent>(_selectFilm);
    on<SetInitFilm>(_selectFilm);
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

  void _setInitFilm(SelectFilmEvent event, Emitter<FilmState> emit) async {
    if (state is FilmLoadedState) {
      films = (state as FilmLoadedState).films;
    }
    emit(FilmLoadedState(films , null));
  }
}
