import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:start_project/bloc/images.dart';
import 'package:start_project/film.dart';

class Screen3Bloc extends StatefulWidget {
  static const String detailsScreenRoute = 'screen3BlOC';
  final Film film;

  const Screen3Bloc({Key? key, required this.film}) : super(key: key);

  @override
  State<Screen3Bloc> createState() => _Screen3BlocState();
}

class _Screen3BlocState extends State<Screen3Bloc> {
  @override
  Widget build(BuildContext context) {
    int index =widget.film.imageId;
    String name = widget.film.id;
    BlocProvider.of<FilmBloc>(context).add(films[index].imageId);
    print('add snth');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: BlocBuilder<FilmBloc, String>(
        builder: (context, currentUrl) => Center(
          child: Column(
            children: [
              Text(name),
              CachedNetworkImage(imageUrl: currentUrl),
            ],
          ),
        ),
      ),
    );
  }
}
