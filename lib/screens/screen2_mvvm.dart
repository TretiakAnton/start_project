import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/src/provider.dart';
import 'package:start_project/film.dart';
import 'package:start_project/screens/screens.dart';
import 'package:start_project/viewmodel/film_view_model.dart';

class Screen2MVVM extends StatefulWidget {
  static const String detailsScreenRoute = 'screen2MVVM';

  const Screen2MVVM({Key? key}) : super(key: key);

  @override
  State<Screen2MVVM> createState() => _Screen2MVVMState();
}

class _Screen2MVVMState extends State<Screen2MVVM> {
  @override
  Widget build(BuildContext context) {
    FilmViewModel filmViewModel = context.watch<FilmViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of Films'),
      ),
      body: Center(
        child: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            return _ui(filmViewModel);
          },
        ),
        //_ui(filmViewModel),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.rotate_left),
        tooltip: 'rotate',
        onPressed: () {
          Navigator.of(context).pushNamed(Screen4MVVM.detailsScreenRoute);
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.landscapeLeft,
            DeviceOrientation.landscapeRight
          ]);
          filmViewModel.setFilm(const Film('', ''));
        },
      ),
    );
  }
}

_ui(FilmViewModel filmViewModel) {
  if (!filmViewModel.loading) {
    return RefreshIndicator(
      onRefresh: () async {
        filmViewModel.getPullToRefresh();
      },
      child: ListView.builder(
          itemCount: filmViewModel.filmList.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(Screen3MVVM.detailsScreenRoute);
                  filmViewModel.getSelectedFilm(filmViewModel.filmList[index]);
                },
                title: Text(filmViewModel.filmList[index].id),
              ),
            );
          }),
    );
  } else {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
