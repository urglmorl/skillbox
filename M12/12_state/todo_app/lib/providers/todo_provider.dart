import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';

class TodoProvider extends ChangeNotifier {
  List<Todo> _todos = [];

  List<Todo> get todos => _todos;
  List<Todo> get doneTodos => _todos.where((t) => t.isDone == true).toList();

  List<Todo> doneAndFilteredTodos(String filter) {
    return filter == '' ? doneTodos : _filter(filter);
  }

  List<Todo> _filter(String filter) {
    RegExp exp = RegExp('.*' + filter + '.*');
    return doneTodos.where((element) => exp.hasMatch(element.title)).toList();
  }

  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void addTodoByTitle({@required String title}) {
    Todo todo = Todo(title: title);
    addTodo(todo);
  }

  void toggleTodo(Todo todo) {
    _toggleTodoById(todo.id);
  }

  void _toggleTodoById(UniqueKey id) {
    _todos.forEach((t) {
      if (t.id == id) {
        t.toggle();
        notifyListeners();
        return;
      }
    });
  }

  void deleteTodo(Todo todo) {
    _deleteTodoById(todo.id);
  }

  void _deleteTodoById(UniqueKey id) {
    _todos = _todos.where((t) => t.id != id).toList();
    notifyListeners();
  }
}
