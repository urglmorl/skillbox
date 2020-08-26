import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _border = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(15)),
    borderSide: BorderSide(
      color: Colors.purple,
      width: 2.0,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text field styled'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                suffixIcon: Icon(
                  Icons.search,
                  color: Colors.purple,
                ),
                hintText: 'Введите значение',
                labelText: 'Search      ',
                labelStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.purple,
                ),
                helperText: 'Поле для поиска заметок',
                enabledBorder: _border,
                focusedBorder: _border,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                suffixIcon: Icon(
                  Icons.search,
                  color: Colors.purple,
                ),
                hintText: 'Введите значение',
                labelText: 'Search     ',
                labelStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.purple,
                ),
                helperText: 'Поле для поиска заметок',
                enabledBorder: _border,
                focusedBorder: _border,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
