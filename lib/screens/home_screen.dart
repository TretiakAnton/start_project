import 'package:flutter/material.dart';
import 'package:start_project/screens/choose_screen_bloc.dart';
import 'package:start_project/screens/choose_screen_mvvm.dart';

class HomeScreen extends StatelessWidget {
  static const String detailsScreenRoute = 'home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            //    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('Choose one'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(ChooseScreenBloc.detailsScreenRoute);
                        },
                        child: const Text('Bloc')),
                    OutlinedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(ChooseScreenMvvm.detailsScreenRoute);
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
