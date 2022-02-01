import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:start_project/film.dart';

Widget loading() {
  return const Center(child: CircularProgressIndicator());
}

Widget details(Film? film) {
  return Container(
    padding: const EdgeInsets.all(5),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [Text(film!.id), CachedNetworkImage(imageUrl: film.url)],
    ),
  );
}

class Landscape extends StatelessWidget {
  const Landscape(
    this.film, {
    required this.ifSelected,
    required this.list,
    required this.onFilmSelected,
  }) : super();

  final bool ifSelected;
  final List<Film> list;
  final Film? film;
  final Function(int) onFilmSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: ListOfFilms(
              list: list,
              onFilmSelected: (int index) {
                onFilmSelected(index);
              },
            )),
        Expanded(
          flex: 2,
          child: SingleChildScrollView(child: _details(ifSelected, film)),
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

class ListOfFilms extends StatelessWidget {
  const ListOfFilms(
      {Key? key, required this.list, required this.onFilmSelected, required this.ifSelected, required this.selectedFilm})
      : super(key: key);
  final bool ifSelected;
  final Film selectedFilm;
  final List<Film> list;
  final Function(int) onFilmSelected;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              selected: _selected(ifSelected, index, selectedFilm, list),
              onTap: () {
                onFilmSelected(index);
                // Navigator.of(context).pushNamed(screenRoute, arguments: index);
              },
              title: Text(list[index].id),
            ),
          );
        });
  }

  bool _selected(bool ifSelected, int index, Film film, List<Film> films) {
    if (ifSelected) {
      return film == films[index];
    } else {
      return false;
    }
  }
}
