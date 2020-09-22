import 'package:flutter/material.dart';
import 'package:load_file/fetch_file.dart';

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
      home: MyHomePage(title: 'Load file'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String fileName = '';

  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(5.0),
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Theme(
                        data: ThemeData(
                          primaryColor: Colors.black,
                        ),
                        child: TextField(
                          controller: textController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(10.0),
                              ),
                              borderSide: BorderSide(
                                color: Colors.black,
                                width: 1.0,
                              ),
                            ),
                            labelText: "Название файла",
                          ),
                        ),
                      ),
                    ),
                    RaisedButton(
                      child: Text(
                        'Найти',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.horizontal(
                          right: Radius.circular(10.0),
                        ),
                      ),
                      color: Colors.black,
                      onPressed: () {
                        String newFileName =
                            'assets/${textController.value.text}';
                        newFileName = newFileName.endsWith('.txt')
                            ? newFileName
                            : newFileName + '.txt';
                        setState(() {
                          fileName = newFileName;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: fileName == ''
                  ? Container()
                  : FutureBuilder<String>(
                      future: fetchFileFromAssets(fileName),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                            return Center(
                              child: Text('NONE'),
                            );
                            break;
                          case ConnectionState.waiting:
                            return Center(child: CircularProgressIndicator());
                            break;
                          case ConnectionState.done:
                            return SingleChildScrollView(
                                child: Text(snapshot.hasError
                                    ? 'файл не найден'
                                    : snapshot.data));
                            break;
                          default:
                            return SingleChildScrollView(
                              child: Text('Default'),
                            );
                        }
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
