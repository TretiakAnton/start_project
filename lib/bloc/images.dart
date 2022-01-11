import 'package:flutter_bloc/flutter_bloc.dart';

class FilmBloc extends Bloc<int, String> {
  final String whiteScreen = 'https://www.publicdomainpictures.net';

  FilmBloc(String initialState) : super(initialState);

  String get initialState => whiteScreen;

  Stream<String> mapEventToState(int event) async* {
     String _url;
    _url = _urls[event - 1];
    yield _url;
  }
}

List<String> _urls = [
  'https://m.media-amazon.com/images/M/MV5BZWMyYzFjYTYtNTRjYi00OGExLWE2YzgtOGRmYjAxZTU3NzBiXkEyXkFqcGdeQXVyMzQ0MzA0NTM@._V1_.jpg',
  'https://flxt.tmsimg.com/assets/p22804_p_v10_ab.jpg',
  'https://upload.wikimedia.org/wikipedia/en/0/05/Up_%282009_film%29.jpg',
  'https://m.media-amazon.com/images/I/811QWEMy64L._AC_SL1500_.jpg',
  'https://b1.filmpro.ru/c/227206.jpg',
  'https://m.media-amazon.com/images/M/MV5BODQ0NDhjYWItYTMxZi00NTk2LWIzNDEtOWZiYWYxZjc2MTgxXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_.jpg'
];
