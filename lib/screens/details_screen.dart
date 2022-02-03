import 'package:flutter/material.dart';
import 'package:start_project/film.dart';
import 'package:start_project/screens/ui_tools/custom_widgets.dart';

class DetailsScreenArgumets {
  DetailsScreenArgumets(this.film, this.onExitCallback);
  final Film? film;
  final VoidCallback onExitCallback;
}

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    required this.film,
    required this.onExitCallback,
    Key? key,
  }) : super(key: key);

  final Film? film;
  final VoidCallback onExitCallback;
  static const String detailsScreenRoute = 'details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              onExitCallback();
              Navigator.of(context).pop();
            }),
      ),
      body: Center(
        child: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            if (orientation == Orientation.landscape) {
              Future.microtask(() => Navigator.of(context).pop());
            }
            return Details(film: film);
          },
        ),
      ),
    );
  }
}
