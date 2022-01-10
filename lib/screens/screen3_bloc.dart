import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image/src/cached_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:start_project/film.dart';

class Screen3Bloc extends StatefulWidget {
  final Film film;

  const Screen3Bloc({Key? key, required this.film}) : super(key: key);

  @override
  State<Screen3Bloc> createState() => _Screen3BlocState();
}

class _Screen3BlocState extends State<Screen3Bloc> {
  @override
  Widget build(BuildContext context) {
    String name = widget.film.id;
    CachedNetworkImage poster = widget.film.image;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(name),
            Image(image: poster),
          ],
        ),
      ),
    );
  }
}
