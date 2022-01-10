

import 'dart:ui';

import 'package:equatable/equatable.dart';

class Film extends Equatable {

  final String id;
  final Image image;

  const Film(this.id, this.image);

  @override
  List<Object> get props => [ id, image];

  @override
  String toString() {
    return 'Todo {  id: $id }';
  }
}