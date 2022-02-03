import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:start_project/film.dart';
import 'package:start_project/repo/films_repo.dart';
import 'package:start_project/screens/screens.dart';
import 'package:start_project/screens/ui_tools/custom_widgets.dart';
import 'package:start_project/viewmodel/film_view_model.dart';

class ChooseScreenMvvm extends StatelessWidget {
  const ChooseScreenMvvm({Key? key}) : super(key: key);
  static const String detailsScreenRoute = 'screen2Mvvm';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              }),
          title: const Text('List of Films'),
        ),
        body: ChangeNotifierProvider(
          create: (_) =>
              FilmViewModel(FilmRepository())..getFilmList(isShuffle: false),
          child: Consumer<FilmViewModel>(
            builder: (context, filmViewModel, child) => Center(
              child: OrientationBuilder(
                  builder: (BuildContext context, Orientation orientation) {
                if (filmViewModel.filmList.isNotEmpty) {
                  if (orientation == Orientation.portrait) {
                    filmViewModel.setSelected(ifSelected: false);
                    return RefreshIndicator(
                      onRefresh: () =>
                          filmViewModel.getFilmList(isShuffle: true),
                      child: ListOfFilms(
                        filmViewModel.filmList,
                        (Film film) {
                          filmViewModel.getSelectedFilm(film);
                          filmViewModel.setSelected(ifSelected: true);
                          Navigator.of(context).pushNamed(
                              DetailsScreen.detailsScreenRoute,
                              arguments: {
                                'film': film,
                                'route': detailsScreenRoute
                              });
                        },
                        false,
                      ),
                    );
                  } else {
                    if(!filmViewModel.ifSelected){
                      filmViewModel.getSelectedFilm(const Film('', ''));
                    }
                    return Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: ListOfFilms(
                              filmViewModel.filmList,
                              (Film film) {
                                filmViewModel.getSelectedFilm(film);
                                filmViewModel.setSelected(ifSelected: true);
                              },
                              true,
                              filmViewModel.film,
                            )),
                        Expanded(
                            flex: 2,
                            child: Details(
                              film: filmViewModel.film,
                            ))
                      ],
                    );
                  }
                } else {
                  return loading();
                }
              }),
            ),
          ),
        ));
  }
}
