import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum ImageEvent  {image1,image2,image3,image4,image5,image6}
class FilmBloc extends Bloc<ImageEvent, CachedNetworkImage>{
  late CachedNetworkImage _image;
  @override
  CachedNetworkImage get initialState => CachedNetworkImage(imageUrl: 'https://www.publicdomainpictures.net/pictures/130000/velka/white-background.jpg',);

  @override
  Stream<CachedNetworkImage> mapEventToState(ImageEvent event) async* {
    switch(event){
      case ImageEvent.image1:
        _image = CachedNetworkImage(imageUrl: _urls[0]);
        break;
      case ImageEvent.image2:
        _image = CachedNetworkImage(imageUrl: _urls[1]);
        break;
      case ImageEvent.image3:
        _image = CachedNetworkImage(imageUrl: _urls[2]);
        break;
      case ImageEvent.image4:
        _image = CachedNetworkImage(imageUrl: _urls[3]);
        break;
      case ImageEvent.image5:
        _image = CachedNetworkImage(imageUrl: _urls[4]);
        break;
      case ImageEvent.image6:
        _image = CachedNetworkImage(imageUrl: _urls[5]);
        break;
      default :
        _image=CachedNetworkImage(imageUrl: 'https://www.publicdomainpictures.net');
    }
    yield _image;
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