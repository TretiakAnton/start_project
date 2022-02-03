import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:start_project/film.dart';

class ListOfFilms extends StatelessWidget {
  const ListOfFilms({
    required this.list,
    required this.onFilmSelected,
    required this.onRefresh,
    Key? key,
  }) : super(key: key);

  final List<Film> list;
  final Function(Film) onFilmSelected;
  final AsyncCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    return list.isEmpty
        ? loading()
        : RefreshIndicator(
            onRefresh: onRefresh,
            child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      onTap: () {
                        onFilmSelected(list[index]);
                      },
                      title: Text(list[index].id),
                    ),
                  );
                }),
          );
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
      return const Center(
        child: Text('No data'),
      );
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
