import 'dart:convert';

import '../film.dart';
import 'package:http/http.dart' as http;

Uri address = Uri.parse('https://putsreq.com/1vupmovCKZ78Jzs8qeCm');

class FilmRepository {
  Future<List<Film>> getListOfFilms() async {
    http.Response response = await http.get(address);
    print('get data');
    /*Map filmData = jsonDecode(response.body);
    List<dynamic> films = filmData['results'];*/
    List<dynamic> films= jsonDecode(response.body);
    print('return data');
    return films.map((json) => Film.fromJSON(json)).toList();
  }
}

/*List<Film> films1 = [
  const Film('Spider-man',
      'https://m.media-amazon.com/images/M/MV5BZWMyYzFjYTYtNTRjYi00OGExLWE2YzgtOGRmYjAxZTU3NzBiXkEyXkFqcGdeQXVyMzQ0MzA0NTM@._V1_.jpg'),
  const Film('Matrix', 'https://flxt.tmsimg.com/assets/p22804_p_v10_ab.jpg'),
  const Film('Up',
      'https://upload.wikimedia.org/wikipedia/en/0/05/Up_%282009_film%29.jpg'),
  const Film('Grinch',
      'https://m.media-amazon.com/images/I/811QWEMy64L._AC_SL1500_.jpg'),
  const Film(
    'Beethoven',
    'https://b1.filmpro.ru/c/227206.jpg',
  ),
  const Film('Jumanji',
      'https://m.media-amazon.com/images/M/MV5BODQ0NDhjYWItYTMxZi00NTk2LWIzNDEtOWZiYWYxZjc2MTgxXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_.jpg'),
];*/
