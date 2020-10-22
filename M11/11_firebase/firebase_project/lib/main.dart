import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_project/services/auth_service.dart';
import 'package:firebase_project/views/login_view.dart';
import 'package:firebase_project/views/profile_view.dart';
import 'package:firebase_project/views/todo_view.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: _authService.getCurrentUser() == null
          ? LoginView.routeName
          : ProfileView.routeName,
      routes: {
        LoginView.routeName: (BuildContext context) => LoginView(),
        ProfileView.routeName: (BuildContext context) => ProfileView(),
        TodoView.routeName: (BuildContext context) => TodoView(),
      },
    );
  }
}
