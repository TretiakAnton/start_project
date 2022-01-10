import 'package:flutter/material.dart';
import 'package:start_project/film.dart';

class TodoItem extends StatelessWidget {
  final DismissDirectionCallback onDismissed;
  final GestureTapCallback onTap;
  final ValueChanged<bool> onCheckboxChanged;
  final Film film;

  TodoItem({
    Key? key,
    required this.onDismissed,
    required this.onTap,
    required this.onCheckboxChanged,
    required this.film,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: onDismissed,
      key: null,
      child: ListTile(
        onTap: onTap,
        leading: Checkbox(
          value: film.complete,
          onChanged: onCheckboxChanged,
        ),
        title: Hero(
          tag: '${film.id}__heroTag',
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Text(
              film.task,
              key: ArchSampleKeys.todoItemTask(film.id),
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ),
        subtitle: film.note.isNotEmpty
            ? Text(
          film.note,
          key: ArchSampleKeys.todoItemNote(film.id),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.subtitle1,
        )
            : null,
      ),
    );
  }
}