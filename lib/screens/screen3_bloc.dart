import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:start_project/bloc/bloc.dart';

import 'screens.dart';

class Screen3Bloc extends StatefulWidget {
  static const String detailsScreenRoute = 'screen3BlOC';

  const Screen3Bloc({Key? key}) : super(key: key);

  @override
  State<Screen3Bloc> createState() => _Screen3BlocState();
}

class _Screen3BlocState extends State<Screen3Bloc> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilmBloc, FilmState>(
      builder: (_, filmState) {
        return Scaffold(
            appBar: AppBar(
              title: const Text('Details'),
            ),
            body: _ui(filmState),
            floatingActionButton: FloatingActionButton(onPressed: () {
              Navigator.of(context).pushNamed(Screen4Bloc.detailsScreenRoute);
              SystemChrome.setPreferredOrientations([
                DeviceOrientation.landscapeLeft,
                DeviceOrientation.landscapeRight
              ]);
            }));
      },
    );
  }
}

_ui(FilmState filmState) {
  if (filmState is FilmLoadedState && filmState.selectedFilm!.url.isNotEmpty) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(filmState.selectedFilm!.id),
            CachedNetworkImage(imageUrl: filmState.selectedFilm!.url)
          ],
        ),
      ),
    );
  } else {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
