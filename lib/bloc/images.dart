import 'package:flutter_bloc/flutter_bloc.dart';

class FilmBloc extends Bloc<int, String> {
  FilmBloc(String initialState) : super('https://image.winudf.com/v2/image1/aHUuYmthbG1hbi5hbmRyb2lkLmFwcC53aGl0ZXNjcmVlbl9zY3JlZW5fMV8xNTY3MDI0NzUwXzAwMw/screen-1.jpg?fakeurl=1&type=.jpg') {
    on<int>((event, emit)  {
      _getImageUrl(event,emit);
    });
  }

  String initialState = 'https://image.winudf.com/v2/image1/aHUuYmthbG1hbi5hbmRyb2lkLmFwcC53aGl0ZXNjcmVlbl9zY3JlZW5fMV8xNTY3MDI0NzUwXzAwMw/screen-1.jpg?fakeurl=1&type=.jpg';

  void _getImageUrl(int event, Emitter emitter) {
    String _url;
    _url = _urls[event - 1];
    emitter(_url);
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
