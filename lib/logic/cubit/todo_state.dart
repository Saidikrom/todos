part of 'todo_cubit.dart';

@immutable
class TodoState {
  final List<Todo> todos;

  const TodoState(this.todos);
}

class TodoInitial extends TodoState {
  final List<Todo> todo;

  const TodoInitial(this.todo) : super(todo);
}

class TodoAdded extends TodoState {
  const TodoAdded(List<Todo> todos) : super(todos);
}
class TodoEdited extends TodoState {
  const TodoEdited(List<Todo> todos) : super(todos);
}
class TodoToggled extends TodoState {
  const TodoToggled(List<Todo> todos) : super(todos);
}
class TodoRing extends TodoState {
  const TodoRing(List<Todo> todos) : super(todos);
}
class TodoDeleted extends TodoState {
  const TodoDeleted(List<Todo> todos) : super(todos);
}
