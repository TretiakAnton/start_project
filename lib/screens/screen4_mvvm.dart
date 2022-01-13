import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:start_project/viewmodel/film_view_model.dart';

class Screen4MVVM extends StatefulWidget {
  static const String detailsScreenRoute = 'screen4MVVM';

  const Screen4MVVM({Key? key}) : super(key: key);

  @override
  State<Screen4MVVM> createState() => _Screen4MVVMState();
}

class _Screen4MVVMState extends State<Screen4MVVM> {
  @override
  Widget build(BuildContext context) {
    FilmViewModel filmViewModel = context.watch<FilmViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: _ui(filmViewModel),
    );
  }
}

_ui(FilmViewModel filmViewModel) {
  if (!filmViewModel.loading) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(filmViewModel.film.id),
            CachedNetworkImage(imageUrl: filmViewModel.film.url)
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
