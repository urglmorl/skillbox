import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/services/auth_service.dart';
import 'package:firebase_project/services/storage_service.dart';
import 'package:firebase_project/views/login_view.dart';
import 'package:firebase_project/views/todo_view.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileView extends StatefulWidget {
  static String routeName = '/profile';

  ProfileView({Key key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  User _currentUser;
  AuthService _authService;
  StorageService _storageService;

  final picker = ImagePicker();

  Future setImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    String fileURL = await _storageService.saveImageByUserId(
        _currentUser.uid, File(pickedFile.path));
    User updatedUser = await _authService.updateUser(photoURL: fileURL);
    setState(() {
      _currentUser = updatedUser;
    });
  }

  @override
  void initState() {
    super.initState();
    _authService = AuthService();
    _storageService = StorageService();
    _currentUser = _authService.getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Profile'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(TodoView.routeName);
            },
            icon: Icon(
              Icons.list,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: _currentUser.photoURL == null
                      ? CircleAvatar(
                          radius: 50,
                          child: Icon(Icons.add_a_photo),
                        )
                      : CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(_currentUser.photoURL),
                        ),
                  onTap: () {
                    setImage();
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text('${_currentUser.email}'),
                ),
                RaisedButton(
                  child: Text('Выйти'),
                  onPressed: () async {
                    await _authService.signOut();
                    Navigator.of(context).pushNamed(LoginView.routeName);
                  },
                ),
                if (_currentUser.emailVerified)
                  RaisedButton(
                    child: Text('Подтвердить email'),
                    onPressed: () {
                      _authService.sendEmailConfirmation();
                    },
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
