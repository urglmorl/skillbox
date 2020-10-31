import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/components/add_todo_widget.dart';
import 'package:todo_app/components/done_todo_list_widget.dart';
import 'package:todo_app/components/find_todo_widget.dart';
import 'package:todo_app/components/todo_list_widget.dart';
import 'package:todo_app/models/tab.dart';
import 'package:todo_app/providers/filter_provider.dart';
import 'package:todo_app/providers/todo_provider.dart';

class TabProvider extends ChangeNotifier {
  List<TabModel> _tabs = [
    TabModel(
      title: 'Список задач',
      appBarColor: Colors.black,
      appBarWidget: AddTodoWidget(),
      body: Consumer<TodoProvider>(
        builder: (context, todoProvider, child) {
          return TodoListWidget(
            listViewKey: PageStorageKey('Список задач'),
            todos: todoProvider.todos,
          );
        },
      ),
    ),
    TabModel(
      title: 'Выполненные',
      appBarColor: Colors.indigo,
      appBarWidget: FindTodoWidget(),
      body: Consumer2<TodoProvider, FilterProvider>(
        builder: (context, todoProvider, filterProvider, child) {
          return DoneTodoListWidget(
            listViewKey: PageStorageKey('Выполненные'),
            todos: todoProvider.doneAndFilteredTodos(
              filterProvider.filter,
            ),
          );
        },
      ),
    ),
  ];

  int _currentTabIndex = 0;

  int get currentTabIndex => _currentTabIndex;
  List<TabModel> get tabs => _tabs;

  TabModel getCurrentTab() {
    return _tabs.elementAt(_currentTabIndex);
  }

  void toggleTab(TabModel tab) {
    int index = _tabs.indexWhere((element) => element.id == tab.id);
    setCurrentTabIndex(index);
  }

  void setCurrentTabIndex(int index) {
    _currentTabIndex = index;
    notifyListeners();
  }
}
