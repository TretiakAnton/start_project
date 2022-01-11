import 'package:flutter_bloc/flutter_bloc.dart';

enum ImageEvent { image1, image2, image3, image4, image5, image6 }

class FilmBloc extends Bloc<ImageEvent, String> {
  late String _url;
  final String whiteScreen = 'https://www.publicdomainpictures.net';

 FilmBloc(String initialState) : super(initialState);

 @override
  String get initialState => whiteScreen;

  @override
  Stream<String> mapEventToState(ImageEvent event) async* {
    switch (event) {
      case ImageEvent.image1:
        _url = _urls[0];
        break;
      case ImageEvent.image2:
        _url = _urls[0];
        break;
      case ImageEvent.image3:
        _url = _urls[0];
        break;
      case ImageEvent.image4:
        _url = _urls[0];
        break;
      case ImageEvent.image5:
        _url = _urls[0];
        break;
      case ImageEvent.image6:
        _url = _urls[0];
        break;
      default:
        _url = whiteScreen;
    }
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
