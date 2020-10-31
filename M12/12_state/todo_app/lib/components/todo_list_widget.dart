import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/providers/todo_provider.dart';

class TodoListWidget extends StatelessWidget {
  const TodoListWidget({
    Key key,
    this.listViewKey,
    @required this.todos,
  }) : super(key: key);

  final List<Todo> todos;
  final PageStorageKey listViewKey;

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoProvider>(
      builder: (context, provider, child) {
        return ListView.builder(
          key: listViewKey,
          itemCount: todos.length,
          itemBuilder: (BuildContext context, int index) {
            Todo todo = todos[index];
            return CheckboxListTile(
              value: todo.isDone,
              title: Text(todo.title),
              onChanged: (_) {
                provider.toggleTodo(todo);
              },
            );
          },
        );
      },
    );
  }
}
