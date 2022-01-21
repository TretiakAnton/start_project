import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:start_project/bloc/bloc.dart';

import '../task_performer.dart';
import 'screens.dart';

class Screen3 extends StatefulWidget {
  static const String detailsScreenRoute = 'screen3';
  final TaskPerformer taskPerformer;

  const Screen3({Key? key, required this.taskPerformer}) : super(key: key);

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilmBloc, FilmState>(
      builder: (_, filmState) {
        return Scaffold(
            appBar: AppBar(
              title: const Text('Details'),
            ),
            body: _ui(filmState),
            floatingActionButton: FloatingActionButton(
                child: const Icon(Icons.rotate_left),
                tooltip: 'rotate',
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(Screen4Bloc.detailsScreenRoute);
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
