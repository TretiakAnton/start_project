import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:start_project/bloc/bloc.dart';

import '../film.dart';

class Screen4Bloc extends StatefulWidget {
  static const String detailsScreenRoute = 'screen4BlOC';

  const Screen4Bloc({Key? key}) : super(key: key);

  @override
  State<Screen4Bloc> createState() => _Screen4BlocState();
}

class _Screen4BlocState extends State<Screen4Bloc> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilmBloc, FilmState>(
      builder: (_, filmState) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                BlocProvider.of<FilmBloc>(context)
                    .add(SelectFilmEvent(const Film(
                  '',
                  '',
                )));
                SystemChrome.setPreferredOrientations([
                  DeviceOrientation.portraitUp,
                  DeviceOrientation.portraitDown
                ]);
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
            ),
            title: const Text('Landscape Screen'),
          ),
          body: _ui(filmState),
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.rotate_left),
            tooltip: 'rotate',
            onPressed: () {
              Navigator.of(context).pop();
              SystemChrome.setPreferredOrientations([
                DeviceOrientation.portraitUp,
                DeviceOrientation.portraitDown
              ]);
            },
          ),
        );
      },
    );
  }
}

_ui(FilmState filmState) {
  if (filmState is FilmLoadedState && filmState.films.isNotEmpty) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: ListView.builder(
              itemCount: filmState.films.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    selected: filmState.films[index] == filmState.selectedFilm,
                    onTap: () {
                      BlocProvider.of<FilmBloc>(context)
                          .add(SelectFilmEvent(filmState.films[index]));
                    },
                    title: Text(filmState.films[index].id),
                  ),
                );
              }),
        ),
        Expanded(
          flex: 2,
          child: _rightPart(filmState),
        )
      ],
    );
  } else {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

_rightPart(FilmLoadedState filmState) {
  if (filmState.selectedFilm!.url.isNotEmpty) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.all(5),
              child: Text(filmState.selectedFilm!.id)),
          CachedNetworkImage(imageUrl: filmState.selectedFilm!.url),
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
