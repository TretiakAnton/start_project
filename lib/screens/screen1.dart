import 'package:flutter/material.dart';
import 'package:start_project/screens/screen2.dart';

import '../task_performer.dart';

class Screen1 extends StatelessWidget {
  static const String detailsScreenRoute = 'screen1';

  const Screen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('Choose one'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                              Screen2.detailsScreenRoute,
                              arguments: TaskPerformer.bloc);
                        },
                        child: const Text('Bloc')),
                    OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                              Screen2.detailsScreenRoute,
                              arguments: TaskPerformer.mvvm);
                        },
                        child: const Text('MVVM')),
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
