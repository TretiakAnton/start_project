import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:start_project/film.dart';

Widget loading() {
  return const Center(child: CircularProgressIndicator());
}

Widget listOfFilms(String screenRoute, List<Film> list) {
  return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            onTap: () {
              Navigator.of(context).pushNamed(screenRoute, arguments: index);
            },
            title: Text(list[index].id),
          ),
        );
      });
}

Widget details(Film? film) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [Text(film!.id), CachedNetworkImage(imageUrl: film.url)],
  );
}

Widget landscape([int? selectedIndex]) {
  return Center();
}
