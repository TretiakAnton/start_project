import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:start_project/bloc/images.dart';
import 'package:start_project/route_generator.dart';
import 'package:start_project/screens/screen1.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider<FilmBloc>(
      create: (context) => FilmBloc('https://image.winudf.com/v2/image1/aHUuYmthbG1hbi5hbmRyb2lkLmFwcC53aGl0ZXNjcmVlbl9zY3JlZW5fMV8xNTY3MDI0NzUwXzAwMw/screen-1.jpg?fakeurl=1&type=.jpg'),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        onGenerateRoute: RouteGenerator.onGenerateRoute,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: const Screen1());
  }
}
