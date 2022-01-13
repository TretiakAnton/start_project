import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:start_project/viewmodel/film_view_model.dart';

class Screen4MVVM extends StatefulWidget {
  static const String detailsScreenRoute = 'screen4MVVM';

  const Screen4MVVM({Key? key}) : super(key: key);

  @override
  State<Screen4MVVM> createState() => _Screen4MVVMState();
}

class _Screen4MVVMState extends State<Screen4MVVM> {
  final _appBar = AppBar(
    title: const Text('Landscape Screen'),
  );

  @override
  Widget build(BuildContext context) {
    final _topHeight = MediaQuery.of(context).padding.top;
    final _appBarHeight = _appBar.preferredSize.height;
    final _fullScreenHeight = MediaQuery.of(context).size.height;
    final functionalHeight = _fullScreenHeight - _topHeight - _appBarHeight;
    FilmViewModel filmViewModel = context.watch<FilmViewModel>();
    return Scaffold(
      appBar: _appBar,
      body: _ui(filmViewModel, functionalHeight),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .pushReplacementNamed(Screen4MVVM.detailsScreenRoute);
        },
      ),
    );
  }
}

_ui(FilmViewModel filmViewModel, double height) {
  if (!filmViewModel.loading) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          SizedBox(
            height: (height * 0.33),
            child: ListView.builder(
                itemCount: filmViewModel.filmList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      onTap: () {
                        //Navigator.of(context).pushNamed(Screen3MVVM.detailsScreenRoute);
                        filmViewModel.getSelectedFilm(
                            filmViewModel.filmList.elementAt(index));
                        filmViewModel.getSelectedFilm(
                            filmViewModel.setLoadingLandscape(true));
                      },
                      title: Text(filmViewModel.filmList[index].id),
                    ),
                  );
                }),
          ),
          SizedBox(
            height: (height * 0.67),
            child: _rightPart(filmViewModel),
          )
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
    return Column(
      children: [
        Text(filmViewModel.film.id),
        CachedNetworkImage(imageUrl: filmViewModel.film.url),
      ],
    );
  } else {
    return Column(children: const [
      Text('Waiting for you to choose film'),
      CircularProgressIndicator(),
    ]);
  }
}
