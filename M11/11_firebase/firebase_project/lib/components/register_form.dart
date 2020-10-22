import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/services/auth_service.dart';
import 'package:firebase_project/utils/validate_email.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  RegisterForm({Key key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  AuthService _authService = AuthService();

  void _handleSubmit() async {
    if (_formKey.currentState.validate()) {
      final String email = _emailController.text;
      final String password = _passwordController.text;

      User user =
          await _authService.registerWithEmailAndPassword(email, password);
      if (user != null) {
        user = await _authService.signIn(email, password);
      } else {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("Nope!"),
        ));
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            key: Key('registrationFormFieldEmail'),
            controller: _emailController,
            decoration: InputDecoration(labelText: 'Email'),
            validator: (value) {
              if (value == '') return 'Заполните поле email';
              if (!validateEmail(value)) return 'Email не корректный';
              return null;
            },
            keyboardType: TextInputType.emailAddress,
          ),
          TextFormField(
            key: Key('registrationFormFieldPassword'),
            controller: _passwordController,
            obscureText: true,
            validator: (value) {
              if (value == '') return 'Введите пароль';
              return null;
            },
            decoration: InputDecoration(labelText: 'Пароль'),
          ),
          RaisedButton(
            child: Text('Зарегистрироваться'),
            onPressed: _handleSubmit,
          ),
        ],
      ),
    );
  }
}
