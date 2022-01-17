import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:start_project/bloc/bloc.dart';
import 'package:start_project/screens/screen3_bloc.dart';
import 'package:start_project/screens/screen4_bloc.dart';

class Screen2Bloc extends StatefulWidget {
  static const String detailsScreenRoute = 'screen2BlOC';

  const Screen2Bloc({Key? key}) : super(key: key);

  @override
  State<Screen2Bloc> createState() => _Screen2BlocState();
}

class _Screen2BlocState extends State<Screen2Bloc> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilmBloc, FilmState>(
      builder: (_, filmState) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('List of Films'),
          ),
          body: _ui(filmState),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pushNamed(Screen4Bloc.detailsScreenRoute);
              SystemChrome.setPreferredOrientations([
                DeviceOrientation.landscapeLeft,
                DeviceOrientation.landscapeRight
              ]);
              BlocProvider.of<FilmBloc>(context).add(SetInitFilm());
              //filmViewModel.setInitialSelected();
            },
          ),
        );
      },
    );
  }
}

_ui(FilmState filmState) {
  if (filmState is FilmLoadedState) {
    return ListView.builder(
        itemCount: filmState.films.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.of(context).pushNamed(Screen3Bloc.detailsScreenRoute);
              BlocProvider.of<FilmBloc>(context)
                  .add(SelectFilmEvent(filmState.films[index]));
            },
            title: Text(filmState.films[index].id),
          );
        });
  } else {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
