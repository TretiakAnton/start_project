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

Widget landscape(bool ifSelected, String screenRoute, List<Film> list,
    [Film? selectedFilm]) {
  return Center();
}

class Landscape extends StatelessWidget {
  Landscape(this.film,
      {required this.ifSelected, required this.screenRoute, required this.list})
      : super();

  final bool ifSelected;
  final String screenRoute;
  final List<Film> list;
  final Film? film;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1, child: listOfFilms(screenRoute, list)),
        Expanded(
          flex: 2,
          child: _details(ifSelected, film),
        )
      ],
    );
  }

  Widget _details(bool ifSelected, Film? film) {
    if (ifSelected) {
      return details(film);
    } else {
      return loading();
    }
  }
}
