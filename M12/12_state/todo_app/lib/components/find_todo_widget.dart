import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/filter_provider.dart';

class FindTodoWidget extends StatelessWidget {
  FindTodoWidget({Key key}) : super(key: key);

  final TextEditingController _findTextFieldController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<FilterProvider>(
      builder: (context, filterProvider, child) {
        return TextField(
          controller: _findTextFieldController,
          decoration: InputDecoration(
            labelText: 'Поиск',
            suffix: Icon(
              Icons.search,
              color: Colors.blue,
            ),
          ),
          onChanged: (value) {
            filterProvider.setFilter(value);
          },
        );
      },
    );
  }
}
