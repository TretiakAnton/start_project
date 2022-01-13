import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:start_project/bloc/bloc.dart';
import 'package:start_project/repo/films_repo.dart';

import 'package:start_project/route_generator.dart';
import 'package:start_project/screens/screen1.dart';
import 'package:start_project/viewmodel/film_view_model.dart';

void main() {

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_)=> FilmViewModel(FilmRepository())),
      BlocProvider<FilmBloc>(create: (context) => FilmBloc(FilmRepository())..add(LoadFilmsEvent()))
       ],
    child: const MyApp(),
  ));
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
