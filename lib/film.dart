import 'package:cached_network_image/cached_network_image.dart';

class Film {
  final String id;
  final CachedNetworkImage image;

  const Film(this.id, this.image);
}

void initializeImages() {
  for (int index = 1; index <= 6; index++) {
    films.add(Film('id$index', CachedNetworkImage(imageUrl: urls[index])));
  }
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

List<Film> films = [];
