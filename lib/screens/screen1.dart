import 'package:flutter/material.dart';
import 'package:start_project/screens/screen2_bloc.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text('Choose one'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(Screen2Bloc.detailsScreenRoute);
                    },
                    child: const Text('Bloc')),
                OutlinedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(Screen2MVVM.detailsScreenRoute);
                    },
                    child: const Text('MVVM')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
//branch to work on it
