import '../film.dart';

class FilmRepository {
  Future<List<Film>> getListOfFilms() async {
    return films;
  }
}

List<Film> films = [
  const Film('Spider-man', 1,
      'https://m.media-amazon.com/images/M/MV5BZWMyYzFjYTYtNTRjYi00OGExLWE2YzgtOGRmYjAxZTU3NzBiXkEyXkFqcGdeQXVyMzQ0MzA0NTM@._V1_.jpg'),
  const Film('Matrix', 2,
      'https://flxt.tmsimg.com/assets/p22804_p_v10_ab.jpg'),
  const Film('Up', 3,
      'https://upload.wikimedia.org/wikipedia/en/0/05/Up_%282009_film%29.jpg'),
  const Film('Grinch', 4,
      'https://m.media-amazon.com/images/I/811QWEMy64L._AC_SL1500_.jpg'),
  const Film('Beethoven', 5,
    'https://b1.filmpro.ru/c/227206.jpg',),
  const Film('Jumanji', 6,
      'https://m.media-amazon.com/images/M/MV5BODQ0NDhjYWItYTMxZi00NTk2LWIzNDEtOWZiYWYxZjc2MTgxXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_.jpg'),
];