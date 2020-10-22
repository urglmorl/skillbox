import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_project/services/auth_service.dart';
import 'package:firebase_project/services/storage_service.dart';
import 'package:flutter/material.dart';

class TodoView extends StatefulWidget {
  static String routeName = '/todos';

  TodoView({Key key}) : super(key: key);

  @override
  _TodoViewState createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  AuthService _authService;
  StorageService _storageService;

  @override
  void initState() {
    super.initState();
    _authService = AuthService();
    _storageService = StorageService();
  }

  _onAddPressed() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: AddTodoWidget(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: _onAddPressed,
      ),
      body: SafeArea(
        child: Container(
          child: Center(
            child: StreamBuilder<QuerySnapshot>(
              stream: _storageService
                  .getSnapshot(_authService.getCurrentUser().uid),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  print(snapshot.error.toString());
                }
                if ((snapshot.connectionState == ConnectionState.active ||
                        snapshot.connectionState == ConnectionState.done) &&
                    snapshot.hasData) {
                  if (snapshot.data.docs.length == 0) {
                    return Center(
                      child: Text('Ничего не найдено'),
                    );
                  } else {
                    return ListView(
                      children: [
                        ...snapshot.data.docs.map((todo) => CheckboxListTile(
                              value: todo['isDone'],
                              title: Text(todo['title']),
                              subtitle: Text(todo['description']),
                              dense: false,
                              controlAffinity: ListTileControlAffinity.leading,
                              onChanged: (value) {
                                _storageService.toggleTodo(
                                  todo.id,
                                  title: todo['title'],
                                  description: todo['description'],
                                  userId: todo['userId'],
                                  isDone: todo['isDone'],
                                );
                              },
                            ))
                      ],
                    );
                  }
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

class AddTodoWidget extends StatefulWidget {
  AddTodoWidget({Key key}) : super(key: key);

  @override
  _AddTodoWidgetState createState() => _AddTodoWidgetState();
}

class _AddTodoWidgetState extends State<AddTodoWidget> {
  AuthService _authService;
  StorageService _storageService;
  TextEditingController _titleController;
  TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _storageService = StorageService();
    _authService = AuthService();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: IntrinsicWidth(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.horizontal(
                left: Radius.circular(10.0),
                right: Radius.circular(10.0),
              )),
              padding: EdgeInsets.symmetric(
                horizontal: 15.0,
              ),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Создание задачи",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.close,
                      size: 34,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 10.0,
                ),
                child: IntrinsicWidth(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextFormField(
                        controller: _titleController,
                        decoration: InputDecoration(
                          labelText: "title",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      TextFormField(
                        controller: _descriptionController,
                        decoration: InputDecoration(
                          labelText: "description",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: RaisedButton(
                          color: Colors.blue,
                          child: Text(
                            'Создать заметку',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            _storageService.addTodo(
                              title: _titleController.text,
                              description: _descriptionController.text,
                              uid: _authService.getCurrentUser().uid,
                            );
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
