import '../film.dart';

class FilmRepository {
  Future<List<Film>> getListOfFilms() async {
    return films;
  }
}

List<Film> films = [
  const Film('Spider-man',
      'https://m.media-amazon.com/images/M/MV5BZWMyYzFjYTYtNTRjYi00OGExLWE2YzgtOGRmYjAxZTU3NzBiXkEyXkFqcGdeQXVyMzQ0MzA0NTM@._V1_.jpg'),
  const Film('Matrix',
      'https://flxt.tmsimg.com/assets/p22804_p_v10_ab.jpg'),
  const Film('Up',
      'https://upload.wikimedia.org/wikipedia/en/0/05/Up_%282009_film%29.jpg'),
  const Film('Grinch',
      'https://m.media-amazon.com/images/I/811QWEMy64L._AC_SL1500_.jpg'),
  const Film('Beethoven',
    'https://b1.filmpro.ru/c/227206.jpg',),
  const Film('Jumanji',
      'https://m.media-amazon.com/images/M/MV5BODQ0NDhjYWItYTMxZi00NTk2LWIzNDEtOWZiYWYxZjc2MTgxXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_.jpg'),
];