import 'package:flutter/material.dart';

class FilteredTodos extends StatelessWidget {
  FilteredTodos(this.tabItem, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),

      body: Builder(builder: (BuildContext context) {
        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            final Todo todo = todos[index];
            return TodoItem(
              film: todo,
              onDismissed: (direction) {
              },
              onTap: () {
                Navigator.of(context).pushNamed('/screen3BLOC', arguments: todo);
              },
              onCheckboxChanged: (_) {},
            );
          },
        );
      }),
    );
  }
}