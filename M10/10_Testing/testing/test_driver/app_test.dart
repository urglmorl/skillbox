// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Login form tests', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    final loginFormFieldEmail = find.byValueKey('loginFormFieldEmail');
    final loginFormFieldPhone = find.byValueKey('loginFormFieldPhone');
    final loginFormSubmitButton = find.byValueKey('loginFormSubmitButton');
    final loginFormSuccessMessage = find.text('Добро пожаловать');

    test('Test email field', () async {
      await driver.tap(loginFormFieldEmail);
      await driver.waitFor(find.text(''));
      await driver.enterText('test@test.com');
      await driver.waitFor(find.text('test@test.com'));
    });

    test('Test phone field', () async {
      await driver.tap(loginFormFieldPhone);
      await driver.waitFor(find.text(''));
      await driver.enterText('qwerty');
      await driver.waitFor(find.text(''));
      await driver.enterText('89000000000');
      await driver.waitFor(find.text('89000000000'));
    });

    test('Send button', () async {
      await driver.tap(loginFormSubmitButton);
    });

    test('Success text', () async {
      expect(await driver.getText(loginFormSuccessMessage), 'Добро пожаловать');
    });
  });

  group('Rigister form tests', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    final changeFormTypeButton = find.byValueKey('changeFormTypeButton');

    test('change form type', () async {
      await driver.tap(changeFormTypeButton);
    });

    final registrationFormFieldFirstName =
        find.byValueKey('registrationFormFieldFirstName');
    final registrationFormFieldLastName =
        find.byValueKey('registrationFormFieldLastName');
    final registrationFormFieldPhone =
        find.byValueKey('registrationFormFieldPhone');
    final registrationFormFieldEmail =
        find.byValueKey('registrationFormFieldEmail');
    final registrationFormSubmitButton = find.text('Отправить');
    final successText = find.text('Вы успешно зарегистрировались');

    test('Test first name field', () async {
      await driver.tap(registrationFormFieldFirstName);
      await driver.waitFor(find.text(''));
      await driver.enterText('Henry');
      await driver.waitFor(find.text('Henry'));
    });

    test('Test last name field', () async {
      await driver.tap(registrationFormFieldLastName);
      await driver.waitFor(find.text(''));
      await driver.enterText('Aaron');
      await driver.waitFor(find.text('Aaron'));
    });

    test('Test phone field', () async {
      await driver.tap(registrationFormFieldPhone);
      await driver.waitFor(find.text(''));
      await driver.enterText('qwerty');
      await driver.waitFor(find.text(''));
      await driver.enterText('89000000000');
      await driver.waitFor(find.text('89000000000'));
    });

    test('Test email field', () async {
      await driver.tap(registrationFormFieldEmail);
      await driver.waitFor(find.text(''));
      await driver.enterText('test@test.com');
      await driver.waitFor(find.text('test@test.com'));
    });

    test('Send button', () async {
      await driver.tap(registrationFormSubmitButton);
    });

    test('Success text', () async {
      expect(
          await driver.getText(successText), 'Вы успешно зарегистрировались');
    });
  });
}
