import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Page title'),
              background: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    child: Image.network(
                      'https://avatars1.githubusercontent.com/u/19923634?s=460&u=b3a4a20cf754ee2f6738bb2cc5436aee201da888&v=4',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    color: Colors.black38,
                  ),
                ],
              ),
            ),
            pinned: true,
            expandedHeight: 200,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              List.generate(75, (index) => Text('$index')),
            ),
          ),
        ],
      ),
    );
  }
}
