import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/components/alert_dialog_widget.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/providers/todo_provider.dart';

class DoneTodoListWidget extends StatelessWidget {
  const DoneTodoListWidget({
    Key key,
    this.listViewKey,
    @required this.todos,
  }) : super(key: key);

  final List<Todo> todos;
  final PageStorageKey listViewKey;

  _showDialog(BuildContext context, TodoProvider provider, Todo todo) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) {
        return AlertDialogWidget(
          onYes: () {
            provider.deleteTodo(todo);
            Navigator.of(context).pop();
          },
          onNo: () {
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoProvider>(
      builder: (context, provider, child) {
        return ListView.builder(
          key: listViewKey,
          itemCount: todos.length,
          itemBuilder: (BuildContext context, int index) {
            Todo todo = todos[index];
            return Dismissible(
              key: ValueKey('${todo.id}-dismiss'),
              background: Container(
                color: Colors.red,
                child: Icon(Icons.remove),
              ),
              child: ListTile(
                title: Text(todo.title),
                onTap: () {
                  _showDialog(context, provider, todo);
                },
              ),
              onDismissed: (direction) {
                provider.deleteTodo(todo);
              },
            );
          },
        );
      },
    );
  }
}
