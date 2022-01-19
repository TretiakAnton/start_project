import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/src/provider.dart';
import 'package:start_project/viewmodel/film_view_model.dart';

import '../film.dart';

class Screen4MVVM extends StatefulWidget {
  static const String detailsScreenRoute = 'screen4MVVM';

  const Screen4MVVM({Key? key}) : super(key: key);

  @override
  State<Screen4MVVM> createState() => _Screen4MVVMState();
}

class _Screen4MVVMState extends State<Screen4MVVM> {
  @override
  Widget build(BuildContext context) {
    FilmViewModel filmViewModel = context.watch<FilmViewModel>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            SystemChrome.setPreferredOrientations(
                [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
        ),
        title: const Text('Landscape Screen'),
      ),
      body: _ui(filmViewModel),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.rotate_left),
        tooltip: 'rotate',
        onPressed: () {
          SystemChrome.setPreferredOrientations(
              [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
          filmViewModel.setFilm(const Film('', 0, ''));
          Navigator.of(context).pop();
        },
      ),
    );
  }
}

_ui(FilmViewModel filmViewModel) {
  if (!filmViewModel.loading) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            //flex: 1,
            child: ListView.builder(
                itemCount: filmViewModel.filmList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      selected: index == filmViewModel.film.indexId-1,
                      onTap: () {
                        filmViewModel.getSelectedFilm(
                            filmViewModel.filmList.elementAt(index));
                      },
                      title: Text(filmViewModel.filmList[index].id),
                    ),
                  );
                }),
          ),
          Expanded(
            flex: 2,
            child: _rightPart(filmViewModel),
          ),
        ],
      ),
    );
  } else {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

_rightPart(FilmViewModel filmViewModel) {
  if (filmViewModel.film.url.isNotEmpty) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.all(5),
              child: Text(filmViewModel.film.id)),
          CachedNetworkImage(imageUrl: filmViewModel.film.url),
        ],
      ),
    );
  } else {
    return Column(children: const [
      Text('Waiting for you to choose film'),
      CircularProgressIndicator(),
    ]);
  }
}
