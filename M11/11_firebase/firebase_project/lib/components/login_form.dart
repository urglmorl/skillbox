import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/services/auth_service.dart';
import 'package:firebase_project/utils/validate_email.dart';
import 'package:firebase_project/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  AuthService _authService = AuthService();

  @override
  void initState() {
    super.initState();
  }

  void _onSubmit() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        final User user = await _authService.signIn(
          _emailController.text,
          _passwordController.text,
        );
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("${user.email} signed in"),
        ));
        Navigator.of(context).pushNamed(ProfileView.routeName);
      } catch (e) {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("Failed to sign in with Email & Password"),
        ));
      }
      _formKey.currentState.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            key: Key('loginFormFieldEmail'),
            controller: _emailController,
            validator: (value) {
              if (value == '') return 'Введите email';
              if (!validateEmail(value))
                return 'Поле email заполнено не корректно';
              return null;
            },
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(labelText: 'Email'),
          ),
          TextFormField(
            key: Key('loginFormFieldPassword'),
            controller: _passwordController,
            obscureText: true,
            validator: (value) {
              if (value == '') return 'Введите пароль';
              return null;
            },
            decoration: InputDecoration(labelText: 'Пароль'),
          ),
          RaisedButton(
            key: Key('loginFormSubmitButton'),
            child: Text('Войти'),
            onPressed: _onSubmit,
          ),
        ],
      ),
    );
  }
}
