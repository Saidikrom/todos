import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/Todo.dart';

part '../cubit/todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit()
      : super(
          TodoInitial(
            [
              Todo(
                id: GlobalKey().toString(),
                title: 'Go Running',
                time: "7:00",
                color: Colors.red,
                isDone: false,
                isRing: false,
              ),
              Todo(
                id: GlobalKey().toString(),
                title: 'Read more books',
                time: "8:00",
                color: Colors.blue,
                isDone: true,
                isRing: true,
              ),
              Todo(
                id: GlobalKey().toString(),
                title: 'Do nothing!',
                time: "9:00",
                color: Colors.green,
                isDone: false,
                isRing: false,
              ),
            ],
          ),
        );
  void addTodo(String title, Color color, String time) {
    final todo = Todo(
        id: GlobalKey().toString(),
        title: title,
        time: time,
        color: color,
        isRing: false);
    final todos = state.todos;
    todos.add(todo);
    emit(TodoAdded(todos));
    emit(TodoState(todos));
  }

  void editTodo(Todo todo) {
    final todos = state.todos;
    final index = todos.indexWhere((element) => element.id == todo.id);
    todos[index] = todo;
    emit(TodoEdited(todos));
    emit(TodoState(todos));
  }

  void toggleTodo(String id) {
    final todo = state.todos;

    final index = todo.indexWhere((element) => element.id == id);
    todo[index].isDone = !todo[index].isDone;
    emit(TodoToggled(state.todos));
    emit(TodoState(state.todos));
  }

  void ringTodo(String id) {
    final todo = state.todos;

    final index = todo.indexWhere((element) => element.id == id);
    todo[index].isRing = !todo[index].isRing;
    emit(TodoRing(state.todos));
    emit(TodoState(state.todos));
  }

  void deleteTodo(String id) {
    final todo = state.todos;
    todo.removeWhere((element) => element.id == id);
    emit(TodoDeleted(todo));
    emit(TodoState(todo));
  }
}
