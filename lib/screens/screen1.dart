import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  static const String detailsScreenRoute = 'screen1';

  const Screen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
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
                      Navigator.of(context).pushNamed('screen2BlOC',);
                    },
                    child: const Text('Bloc')),
                OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('screen2MVVM',);
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
