import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
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
        onPressed: () {
          Navigator.of(context)
              .pushReplacementNamed(Screen4MVVM.detailsScreenRoute);
          filmViewModel.setLoadingLandscape(true);
          filmViewModel.setOrientationLandscape();
        },
      ),
    );
  }
}

_ui(FilmViewModel filmViewModel) {
  if (!filmViewModel.loading) {
    return ListView.builder(
        itemCount: filmViewModel.filmList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                Navigator.of(context).pushNamed(Screen3MVVM.detailsScreenRoute);
                filmViewModel.getSelectedFilm(filmViewModel.filmList[index]);
               //add notify for load selected film
              },
              title: Text(filmViewModel.filmList[index].id),
            ),
          );
        });
  } else {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
