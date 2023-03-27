import 'package:flutter/material.dart';

class Todo {
  final String id;
  final String title;
  final String time;
  final Color color;
  bool isDone;
  bool isRing;

  Todo({
    required this.id,
    required this.title,
    required this.time,
    required this.color,
    this.isDone = false,
    this.isRing = false,
  });
}
