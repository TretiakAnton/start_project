import 'package:flutter/material.dart';
import 'package:start_project/task_performer.dart';
import 'screens/screens.dart';

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final String? name = settings.name;
    final Object? arguments = settings.arguments;

    if (name == null) {
      return RouteGenerator.onUnknownRoute(settings);
    }

    switch (name) {
      case Screen1.detailsScreenRoute:
        return MaterialPageRoute(
          builder: (_) => const Screen1(),
        );

      case Screen2Bloc.detailsScreenRoute:
        return MaterialPageRoute(
          builder: (_) => const Screen2Bloc(),
        );

      case Screen3.detailsScreenRoute:
        TaskPerformer taskPerformer = TaskPerformer.bloc;
        if (arguments is TaskPerformer) {
          taskPerformer = arguments;
        }
        return MaterialPageRoute(
          builder: (_) => Screen3(
            taskPerformer: taskPerformer,
          ),
        );

      case Screen4.detailsScreenRoute:
        TaskPerformer taskPerformer = TaskPerformer.bloc;
        if (arguments is TaskPerformer) {
          taskPerformer = arguments;
        }
        return MaterialPageRoute(
          builder: (_) => Screen4(
            taskPerformer: taskPerformer,
          ),
        );

      default:
        return RouteGenerator.onUnknownRoute(settings);
    }
  }

  static Route<dynamic> onUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Page not found'),
        ),
      );
    });
  }
}
