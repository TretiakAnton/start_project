import 'dart:convert';

import '../film.dart';
import 'package:http/http.dart' as http;

Uri address = Uri.parse('https://putsreq.com/1vupmovCKZ78Jzs8qeCm');

class FilmRepository {
  Future<List<Film>> getListOfFilms() async {
    http.Response response = await http.get(address);
    List<dynamic> films = jsonDecode(response.body);
    return films.map((json) => Film.fromJSON(json)).toList();
  }
}
