import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:start_project/film.dart';

class Landscape extends StatelessWidget {
  const Landscape(this.ifSelected, this.list, this.onFilmSelected,
      [this.film = const Film('', '')])
      : super();

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
              list,
              (int index) {
                onFilmSelected(index);
              },
              ifSelected,
              film,
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
      return Details(film: film);
    } else {
      return loading();
    }
  }
}

class ListOfFilms extends StatelessWidget {
  const ListOfFilms(this.list, this.onFilmSelected, this.ifSelected,
      [this.selectedFilm = const Film('', '')])
      : super();

  final bool ifSelected;
  final Film? selectedFilm;
  final List<Film> list;
  final Function(int) onFilmSelected;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              selected:
                  _selected(ifSelected, index, selectedFilm as Film, list),
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
      return loading();
    }
  }
}

Widget loading() {
  return const Center(child: CircularProgressIndicator());
}

void backArrow(Orientation orientation, BuildContext context) {
  if (MediaQuery.of(context).orientation == Orientation.landscape) {
    Navigator.of(context).popUntil((route) => route.isFirst);
  } else {
    Navigator.of(context).pop();
  }
}
