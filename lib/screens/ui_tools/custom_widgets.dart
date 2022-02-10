import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:start_project/film.dart';

class ListOfFilms extends StatelessWidget {
  const ListOfFilms(
      {Key? key,
      required this.list,
      required this.onFilmSelected,
      required this.enableSelection,
      this.selectedFilm})
      : super(key: key);

  final bool enableSelection;
  final String? selectedFilm;
  final List<Film> list;
  final Function(String) onFilmSelected;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              selected:
                  _selected(enableSelection, index, selectedFilm as Film, list),
              onTap: () {
                onFilmSelected(list[index].id);
              },
              title: Text(list[index].id),
            ),
          );
        });
  }

  bool _selected(bool isSelected, int index, Film film, List<Film> films) {
    if (isSelected) {
      return film == films[index];
    } else {
      return false;
    }
  }
}

class Details extends StatelessWidget {
  const Details({Key? key, required this.film}) : super(key: key);
  final Film? film;

  @override
  Widget build(BuildContext context) {
    if (film?.id.isNotEmpty ?? false) {
      return SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [Text(film!.id), CachedNetworkImage(imageUrl: film!.url)],
          ),
        ),
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text('Waiting for you choice'),
          loading(),
        ],
      );
    }
  }
}

Widget loading() {
  return const Center(child: CircularProgressIndicator());
}
