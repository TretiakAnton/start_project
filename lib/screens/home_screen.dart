import 'package:flutter/material.dart';
import 'package:start_project/screens/choose_screen_bloc.dart';
import 'package:start_project/screens/choose_screen_mvvm.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String homeScreenRoute = 'home';

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
                        Navigator.of(context)
                            .pushNamed(ChooseScreenBloc.chooseBlocScreenRoute);
                      },
                      child: const Text('Bloc'),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(ChooseScreenMvvm.chooseMvvmScreenRoute);
                      },
                      child: const Text('MVVM'),
                    ),
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
