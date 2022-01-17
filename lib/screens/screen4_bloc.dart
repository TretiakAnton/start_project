import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:start_project/bloc/bloc.dart';

class Screen4Bloc extends StatefulWidget {
  static const String detailsScreenRoute = 'screen4BlOC';

  const Screen4Bloc({Key? key}) : super(key: key);

  @override
  State<Screen4Bloc> createState() => _Screen4BlocState();
}

class _Screen4BlocState extends State<Screen4Bloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
             // filmViewModel.setOrientationPortrait();
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
          ),
          title: const Text('Landscape Screen'),
        ),
        body: BlocBuilder<FilmBloc, FilmState>(
          builder: (_, filmState) {
            if (filmState is FilmLoadedState) {
              return Row(
                children: [
                Expanded(
                flex: 1,
                child: ListView.builder(
                    itemCount: filmState.films.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          BlocProvider.of<FilmBloc>(context)
                              .add(SelectFilmEvent(filmState.films[index]));
                        },
                        title: Text(filmState.films[index].id),
                      );
                    }),
              ),
            Expanded(
            flex:2,
            child: if(true){return 0;}else{})
            ],
            );
            } else {
            return const Center(
            child: CircularProgressIndicator(),
            );
            }
          },
        ));
  }
}
