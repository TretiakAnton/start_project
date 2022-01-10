import 'package:flutter/material.dart';
import 'package:start_project/film.dart';
import 'package:start_project/screens/screen1.dart';

void main() {
  initializeImages();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Screen1(),
    );
  }
}


