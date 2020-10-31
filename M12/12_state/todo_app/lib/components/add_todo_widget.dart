import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/todo_provider.dart';

class AddTodoWidget extends StatelessWidget {
  AddTodoWidget({Key key}) : super(key: key);

  final TextEditingController _addTodoTextFieldController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoProvider>(
      builder: (context, provider, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: TextField(
                controller: _addTodoTextFieldController,
                cursorColor: Colors.white,
                style: TextStyle(
                  color: Colors.white,
                  decorationColor: Colors.white,
                  fontSize: 19,
                ),
                decoration: InputDecoration(
                  labelText: 'Добавить задачу',
                  labelStyle: TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                ),
              ),
            ),
            FlatButton(
              child: Text(
                'Добавить',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                String todoTitle = _addTodoTextFieldController.text;
                if (todoTitle != '') {
                  provider.addTodoByTitle(title: todoTitle);
                  _addTodoTextFieldController.text = '';
                }
              },
            ),
          ],
        );
      },
    );
  }
}
