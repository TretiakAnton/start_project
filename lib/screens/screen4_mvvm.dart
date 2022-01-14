import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:start_project/screens/screen2_mvvm.dart';
import 'package:start_project/viewmodel/film_view_model.dart';

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
            filmViewModel.setOrientationPortrait();
            Navigator.of(context).pop();
          },
        ),
        title: const Text('Landscape Screen'),
      ),
      body: _ui(filmViewModel),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          filmViewModel.setOrientationPortrait();
          if(filmViewModel.route== Screen2MVVM.detailsScreenRoute){
            filmViewModel.setInitialSelected();
          }
          Navigator.of(context).pushReplacementNamed(filmViewModel.route);

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
            flex: 1,
            child: ListView.builder(
                itemCount: filmViewModel.filmList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    selected: index == filmViewModel.selected,
                    onTap: () {
                      filmViewModel.getSelectedFilm(
                          filmViewModel.filmList.elementAt(index));
                      filmViewModel.setSelected(index);
                      filmViewModel.setLoadingLandscape(false);
                    },
                    title: Text(filmViewModel.filmList[index].id),
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
  if (!filmViewModel.loadingLandscape) {
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
