class Film {
  final String id;
  final int imageId;

  const Film(this.id, this.imageId);
}

List<String> filmNames = [];
List<String> urls = [
  'https://m.media-amazon.com/images/M/MV5BZWMyYzFjYTYtNTRjYi00OGExLWE2YzgtOGRmYjAxZTU3NzBiXkEyXkFqcGdeQXVyMzQ0MzA0NTM@._V1_.jpg',
  'https://flxt.tmsimg.com/assets/p22804_p_v10_ab.jpg',
  'https://upload.wikimedia.org/wikipedia/en/0/05/Up_%282009_film%29.jpg',
  'https://m.media-amazon.com/images/I/811QWEMy64L._AC_SL1500_.jpg',
  'https://b1.filmpro.ru/c/227206.jpg',
  'https://m.media-amazon.com/images/M/MV5BODQ0NDhjYWItYTMxZi00NTk2LWIzNDEtOWZiYWYxZjc2MTgxXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_.jpg'
];

List<Film> films = [
  const Film('film1', 1),
  const Film('film2', 2),
  const Film('film3', 3),
  const Film('film4', 4),
  const Film('film5', 5),
  const Film('film6', 6),
];
