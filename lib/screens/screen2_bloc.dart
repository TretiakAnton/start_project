import 'package:flutter/material.dart';
import 'package:start_project/film.dart';

class Screen2Bloc extends StatelessWidget {
  static const String detailsScreenRoute = 'screen1';

  const Screen2Bloc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: films.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).pushNamed('screen3BlOC');
                  },
                  title: Text(films[index].id),
                ),
              );
            }));
  }
}
