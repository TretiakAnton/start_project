import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Screen1 extends StatelessWidget {
  static const String detailsScreenRoute = 'screen1';

  const Screen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('Choose one'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('screen2BlOC');
                        },
                        child: const Text('Bloc')),
                    OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('screen2MVVM');
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
//branch to work on it
