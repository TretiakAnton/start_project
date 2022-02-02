import 'package:flutter/material.dart';
import 'package:start_project/film.dart';
import 'package:start_project/screens/ui_tools/custom_widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key, required this.selectedFilm})
      : super(key: key);

  final Film selectedFilm;
  static const String detailsScreenRoute = 'details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          if (orientation == Orientation.landscape) {
            Navigator.of(context).pop();
          }
          return Details(film: selectedFilm);
        },
      ),
    );
  }
}
