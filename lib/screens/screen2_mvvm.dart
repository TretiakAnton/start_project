import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:start_project/screens/screen3_mvvm.dart';
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
        child: _ui(filmViewModel),
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
                print('push screen');
                Navigator.of(context).pushNamed(Screen3MVVM.detailsScreenRoute);
                filmViewModel.getSelectedFilm(filmViewModel.filmList.elementAt(index));
               //add notify for load selected film
                // BlocProvider.of<FilmBloc>(context).add(SelectFilmEvent(filmState.films[index]));
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
