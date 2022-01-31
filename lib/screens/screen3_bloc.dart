import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:start_project/bloc/bloc.dart';
import 'package:start_project/screens/ui_tools/custom_widgets.dart';

class Screen3Bloc extends StatefulWidget {
  const Screen3Bloc({Key? key, required this.selectedFilm}) : super(key: key);

  final int selectedFilm;
  static const String detailsScreenRoute = 'screen3Bloc';

  @override
  State<Screen3Bloc> createState() => _Screen3BlocState();
}

class _Screen3BlocState extends State<Screen3Bloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Center(
        child: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            return BlocBuilder<BlocThirdScreen, FilmState>(
                builder: (_, filmState) {
              BlocProvider.of<BlocThirdScreen>(context)
                  .add(SelectFilmEvent(widget.selectedFilm));
              if (filmState is FilmLoadedState) {
                if (orientation == Orientation.portrait) {
                  return details(filmState.selectedFilm);
                } else {
                  return Landscape(
                    filmState.selectedFilm,
                    ifSelected: true,
                    list: filmState.films,
                    onFilmSelected: (int index) {
                      BlocProvider.of<BlocThirdScreen>(context)
                          .add(SelectFilmEvent(index));
                    },
                  );
                }
              } else {
                return loading();
              }
            });
          },
        ),
      ),
    );
  }
}
