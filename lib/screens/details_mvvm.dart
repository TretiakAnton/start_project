import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:start_project/film.dart';
import 'package:start_project/screens/ui_tools/custom_widgets.dart';
import 'package:start_project/viewmodel/film_view_model.dart';

class DetailsMvvmScreen extends StatelessWidget {
  const DetailsMvvmScreen(
      {Key? key,  required this.callback})
      : super(key: key);

  final Function(int) callback;
  static const String detailsScreenRoute = 'detailsMvvm';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              callback(1);
              Navigator.of(context).pop();
            }),
        title: const Text('Details'),
      ),
      body: Center(
        child: Consumer<FilmViewModel>(
          builder: (context, filmViewModel, child) => Center(
            child: OrientationBuilder(
              builder: (BuildContext context, Orientation orientation) {
                if (filmViewModel.film.id.isNotEmpty) {
                  if (orientation == Orientation.portrait) {
                    return Details(film: filmViewModel.film);
                  } else {
                    filmViewModel.setSelectedFilm(const Film('', ''));
                    Navigator.of(context).pop();
                    return const CircularProgressIndicator();
                  }
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
