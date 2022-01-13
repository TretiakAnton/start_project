import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:start_project/viewmodel/film_view_model.dart';

class Screen2Bloc extends StatefulWidget {
  static const String detailsScreenRoute = 'screen2MVVM';

  const Screen2Bloc({Key? key}) : super(key: key);

  @override
  State<Screen2Bloc> createState() => _Screen2BlocState();
}

class _Screen2BlocState extends State<Screen2Bloc> {
  @override
  Widget build(BuildContext context) {
    FilmViewModel filmViewModel = context.watch<FilmViewModel>();
    return Scaffold(
        appBar: AppBar(
          title: const Text('List of Films'),
        ),
        body: ListView.builder(
            itemCount: filmState.films.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).pushNamed('screen3BlOC');
                    BlocProvider.of<FilmBloc>(context)
                        .add(SelectFilmEvent(filmState.films[index]));
                  },
                  title: Text(filmState.films[index].id),
                ),
              );
            });


    );
  }
}