import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:start_project/viewmodel/film_view_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Screen3MVVM extends StatefulWidget {
  static const String detailsScreenRoute = 'screen3MVVM';

  const Screen3MVVM({Key? key}) : super(key: key);

  @override
  State<Screen3MVVM> createState() => _Screen3MVVMState();
}

class _Screen3MVVMState extends State<Screen3MVVM> {
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
