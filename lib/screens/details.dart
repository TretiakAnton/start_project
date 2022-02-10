import 'package:flutter/material.dart';
import 'package:start_project/film.dart';
import 'package:start_project/screens/ui_tools/custom_widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    Key? key,
    required this.onExitPageCallback,
    required this.film,
  }) : super(key: key);
  final Film film;
  final VoidCallback onExitPageCallback;
  static const String detailsScreenRoute = 'details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            onExitPageCallback();
            Navigator.of(context).pop();
          },
        ),
        title: const Text('Details'),
      ),
      body: Center(
        child: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            if (orientation == Orientation.portrait) {
              return Details(film: film);
            } else {
              Future.microtask(() => Navigator.of(context).pop());
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

class DetailsScreenArguments {
  const DetailsScreenArguments(
      {required this.film, required this.onExitPageCallback});

  final Film film;
  final VoidCallback onExitPageCallback;
}
