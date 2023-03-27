import 'package:flutter/material.dart';
import 'package:todo/models/Todo.dart';

class Listd extends StatelessWidget {
  final Todo todo;
  const Listd({super.key,required this.todo});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Colors.amber),
      child: Center(
        child: Text(
          todo.title,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
