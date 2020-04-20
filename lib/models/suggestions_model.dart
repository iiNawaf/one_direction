import 'package:flutter/material.dart';

class Suggestion {
  final int id;
  final String email;
  final String title;
  final String description;

  Suggestion({
    @required this.description,
    @required this.id,
    @required this.email,
    @required this.title,
  });
}
