// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing/views/login_view.dart';

void main() {
  group('Login View', () {
    testWidgets('Change states', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: LoginView(),
      ));

      var titleText = find.byKey(Key('titleText'));
      var changeFormTypeButton = find.byKey(Key('changeFormTypeButton'));

      expect(titleText, findsOneWidget);
      expect(find.text('Вход'), findsOneWidget);
      expect(find.text('Регистрация'), findsNothing);

      await tester.tap(changeFormTypeButton);
      await tester.pump();

      expect(find.text('Вход'), findsNothing);
      expect(find.text('Регистрация'), findsOneWidget);

      await tester.tap(changeFormTypeButton);
      await tester.pump();

      expect(find.text('Вход'), findsOneWidget);
      expect(find.text('Регистрация'), findsNothing);

      await tester.tap(changeFormTypeButton);
      await tester.pump();

      expect(find.text('Вход'), findsNothing);
      expect(find.text('Регистрация'), findsOneWidget);
    });

    testWidgets("Login form", (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: LoginView(),
        localizationsDelegates: [
          DefaultMaterialLocalizations.delegate,
          DefaultWidgetsLocalizations.delegate,
        ],
      ));

      var loginFormFieldEmail = find.byKey(Key('loginFormFieldEmail'));
      var loginFormFieldPhone = find.byKey(Key('loginFormFieldPhone'));
      var loginFormSubmitButton = find.text('Отправить');
      var welcomeText = find.text('Добро пожаловать');

      expect(loginFormFieldEmail, findsOneWidget);
      expect(loginFormFieldPhone, findsOneWidget);
      expect(loginFormSubmitButton, findsOneWidget);
      expect(welcomeText, findsNothing);

      await tester.enterText(loginFormFieldEmail, 'testatest.com');
      expect(find.text('testatest.com'), findsOneWidget);

      await tester.enterText(loginFormFieldEmail, 'test@test.com');
      expect(find.text('test@test.com'), findsOneWidget);

      await tester.enterText(loginFormFieldPhone, 'qwerty');
      expect(find.text('qwerty'), findsNothing);

      await tester.enterText(loginFormFieldPhone, '88000000000');
      expect(find.text('88000000000'), findsOneWidget);

      await tester.tap(loginFormSubmitButton);
      await tester.pump();

      expect(welcomeText, findsOneWidget);
    });

    testWidgets("Register form", (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: LoginView(),
        localizationsDelegates: [
          DefaultMaterialLocalizations.delegate,
          DefaultWidgetsLocalizations.delegate,
        ],
      ));

      var changeFormTypeButton = find.byKey(Key('changeFormTypeButton'));

      await tester.tap(changeFormTypeButton);
      await tester.pump();

      var registrationFormFieldFirstName =
          find.byKey(Key('registrationFormFieldFirstName'));
      var registrationFormFieldLastName =
          find.byKey(Key('registrationFormFieldLastName'));
      var registrationFormFieldPhone =
          find.byKey(Key('registrationFormFieldPhone'));
      var registrationFormFieldEmail =
          find.byKey(Key('registrationFormFieldEmail'));
      var registrationFormSubmitButton = find.text('Отправить');
      var successText = find.text('Вы успешно зарегистрировались');

      expect(registrationFormFieldFirstName, findsOneWidget);
      expect(registrationFormFieldLastName, findsOneWidget);
      expect(registrationFormFieldPhone, findsOneWidget);
      expect(registrationFormFieldEmail, findsOneWidget);
      expect(registrationFormSubmitButton, findsOneWidget);
      expect(successText, findsNothing);

      await tester.enterText(registrationFormFieldFirstName, 'Fred');
      expect(find.text('Freddie'), findsNothing);
      expect(find.text('Fred'), findsOneWidget);

      await tester.enterText(registrationFormFieldFirstName, 'Freddie');
      expect(find.text('Fred'), findsNothing);
      expect(find.text('Freddie'), findsOneWidget);

      await tester.enterText(registrationFormFieldLastName, 'Merc');
      expect(find.text('Mercury'), findsNothing);
      expect(find.text('Merc'), findsOneWidget);

      await tester.enterText(registrationFormFieldLastName, 'Mercury');
      expect(find.text('Merc'), findsNothing);
      expect(find.text('Mercury'), findsOneWidget);

      await tester.enterText(registrationFormFieldPhone, 'Jimmie');
      expect(find.text('Jimmie'), findsNothing);

      await tester.enterText(registrationFormFieldPhone, '88000000000');
      expect(find.text('88000000000'), findsOneWidget);

      await tester.enterText(registrationFormFieldEmail, 'testatest.com');
      expect(find.text('testatest.com'), findsOneWidget);

      await tester.enterText(registrationFormFieldEmail, 'test@test.com');
      expect(find.text('test@test.com'), findsOneWidget);

      await tester.tap(registrationFormSubmitButton);
      await tester.pump();

      expect(successText, findsOneWidget);
    });
  });
}
