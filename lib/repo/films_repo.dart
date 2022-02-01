import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:start_project/film.dart';

Uri address = Uri.parse('https://putsreq.com/1vupmovCKZ78Jzs8qeCm');

class FilmRepository {
  Future<List<Film>> getFilms() async {
    final http.Response response = await http.get(address);
    final List<dynamic> films = jsonDecode(response.body);
    return films.map((json) => Film.fromJSON(json)).toList();
  }
}
