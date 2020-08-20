import 'package:flutter/material.dart';

class MenuItem {
  final Widget title;
  final Icon icon;

  MenuItem({this.title, this.icon});
}

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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  final avatarPath =
      'https://avatars1.githubusercontent.com/u/19923634?s=460&u=b3a4a20cf754ee2f6738bb2cc5436aee201da888&v=4';
  TabController _tabController;
  int _currentTabIndex = 0;

  bool _isPaid = false;

  var _menus = [
    MenuItem(title: Text('Photo'), icon: Icon(Icons.home)),
    MenuItem(title: Text('Chat'), icon: Icon(Icons.chat)),
    MenuItem(title: Text('Albums'), icon: Icon(Icons.album)),
  ];

  var _listTilesForDrawer = [
    MenuItem(title: Text('Home'), icon: Icon(Icons.home)),
    MenuItem(title: Text('Profile'), icon: Icon(Icons.portrait)),
    MenuItem(title: Text('Images'), icon: Icon(Icons.image)),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _menus.length,
      vsync: this,
      initialIndex: _currentTabIndex,
    );
    _tabController.addListener(_tabListener);
  }

  void _tabListener() {
    setState(() {
      _currentTabIndex = _tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.account_circle),
                onPressed: () => Scaffold.of(context).openEndDrawer(),
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              ),
            ),
          ],
        ),
        drawer: Drawer(
          child: Container(
            child: Column(
              children: [
                Container(
                  height: 150,
                  child: Center(
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(avatarPath),
                      radius: 50,
                    ),
                  ),
                ),
                Divider(),
                Expanded(
                  child: Column(
                    children: _listTilesForDrawer.map((e) {
                      return ListTile(
                        leading: e.icon,
                        title: e.title,
                        trailing: Icon(Icons.keyboard_arrow_right),
                      );
                    }).toList(),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RaisedButton(
                      onPressed: () {},
                      child: Text('Выход'),
                    ),
                    RaisedButton(
                      onPressed: () {},
                      child: Text('Регистрация'),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        endDrawer: Drawer(
          child: Container(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.yellow[600],
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(avatarPath),
                      radius: 50,
                    ),
                  ),
                  Text('urglmorl'),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  padding: EdgeInsets.all(20),
                  height: 200,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.payment),
                        title: Text('Заказ'),
                        trailing: Text('200 pэ'),
                      ),
                      Center(
                        child: RaisedButton(
                          onPressed: () {
                            setState(() {
                              _isPaid = true;
                            });
                            Navigator.of(context).pop();
                          },
                          child: Text('Оплатить'),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          child: Icon(Icons.payment),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: TabBarView(
          controller: _tabController,
          children: [
            Container(
              color: Colors.grey[100],
              child: Center(
                child: _isPaid ? Text('Оплачено') : Container(),
              ),
            ),
            Container(
              color: Colors.grey[200],
            ),
            Container(
              color: Colors.grey[300],
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              _tabController.index = index;
              _currentTabIndex = index;
            });
          },
          currentIndex: _currentTabIndex,
          items: _menus
              .map((item) => BottomNavigationBarItem(
                    icon: item.icon,
                    title: item.title,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
