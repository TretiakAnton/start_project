import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:start_project/bloc/bloc.dart';
import 'package:start_project/screens/ui_tools/custom_widgets.dart';

class Screen3 extends StatefulWidget {
  final int selectedFilm;
  static const String detailsScreenRoute = 'screen3Bloc';

  Screen3({Key? key, required this.selectedFilm}) : super(key: key)


  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: BlocBuilder<FilmBloc, FilmState>(
          builder: (_, filmState) {
            BlocProvider.of<FilmBloc>(context)
                .add(SelectFilmEvent(widget.selectedFilm));
            if (filmState is FilmLoadedState) {
              return details(filmState.selectedFilm);
            } else {
              return loading();
            }
          }
      ),

    );
  }
}