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
  final List fakeData = List.generate(50, (index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Horizontal list'),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          double width = constraints.constrainWidth();
          return ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                width: 100,
                child: Card(
                  color: Colors.yellow[700],
                  child: Text('${fakeData[index]}'),
                ),
                padding: EdgeInsets.all(10),
              );
            },
            itemCount: fakeData.length,
            scrollDirection: width < 500 ? Axis.horizontal : Axis.vertical,
          );
        },
      ),
    );
  }
}
