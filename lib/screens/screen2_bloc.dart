import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:start_project/bloc/images.dart';
import 'package:start_project/film.dart';

class Screen2Bloc extends StatefulWidget {
  static const String detailsScreenRoute = 'screen2BlOC';

  const Screen2Bloc({Key? key}) : super(key: key);

  @override
  State<Screen2Bloc> createState() => _Screen2BlocState();
}

class _Screen2BlocState extends State<Screen2Bloc> {
  @override
  Widget build(BuildContext context) {
    FilmBloc bloc = BlocProvider.of<FilmBloc>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('List of Films'),
        ),
        body: ListView.builder(
            itemCount: films.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed('screen3BlOC', arguments: films[index]);
                    BlocProvider.of<FilmBloc>(context)
                        .add(films[index].imageId);
                  },
                  title: Text(films[index].id),
                ),
              );
            }));
  }
}
