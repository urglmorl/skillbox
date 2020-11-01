import 'package:flutter/material.dart';

final firstColor = Colors.black54;
final secondColor = Colors.deepOrange[200];

ThemeData _themeLight = ThemeData.light();

ThemeData themeLight = _themeLight.copyWith(
  appBarTheme: _appBarTheme(_themeLight.appBarTheme),
  buttonTheme: _buttonTheme(_themeLight.buttonTheme),
  bottomNavigationBarTheme:
      _bottomNavigationBarThemeData(_themeLight.bottomNavigationBarTheme),
  textTheme: _textLight(_themeLight.textTheme),
  chipTheme: _chipThemeData(),
  cardTheme: _cardTheme(_themeLight.cardTheme),
  indicatorColor: firstColor,
  primaryColor: secondColor,
  dialogBackgroundColor: firstColor,
  backgroundColor: secondColor,
  primaryColorLight: secondColor,
  primaryColorDark: secondColor,
);

TextTheme _textLight(TextTheme base) {
  return base.copyWith(
    button: TextStyle(
      color: firstColor,
    ),
    headline1: TextStyle(
      color: firstColor,
    ),
    headline4: TextStyle(
      fontSize: 25,
      color: firstColor,
    ),
  );
}

AppBarTheme _appBarTheme(AppBarTheme base) {
  return base.copyWith(
    color: firstColor,
    iconTheme: IconThemeData(
      color: secondColor,
    ),
    textTheme: TextTheme(
      headline6: TextStyle(
        fontSize: 20,
        color: secondColor,
      ),
    ),
  );
}

ButtonThemeData _buttonTheme(ButtonThemeData base) {
  return base.copyWith(
    textTheme: ButtonTextTheme.normal,
    buttonColor: secondColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
  );
}

BottomNavigationBarThemeData _bottomNavigationBarThemeData(
    BottomNavigationBarThemeData base) {
  return base.copyWith(
    backgroundColor: firstColor,
    elevation: 0.0,
    selectedItemColor: secondColor,
  );
}

ChipThemeData _chipThemeData() {
  return ChipThemeData(
    backgroundColor: firstColor,
    disabledColor: firstColor,
    selectedColor: secondColor,
    secondarySelectedColor: secondColor,
    padding: EdgeInsets.symmetric(
      horizontal: 10.0,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
    labelStyle: TextStyle(),
    secondaryLabelStyle: TextStyle(),
    brightness: Brightness.light,
    showCheckmark: false,
    shadowColor: firstColor,
    elevation: 5.0,
  );
}

CardTheme _cardTheme(CardTheme base) {
  return base.copyWith(
    shadowColor: firstColor,
    elevation: 10.0,
    color: secondColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    margin: EdgeInsets.all(10.0),
    clipBehavior: Clip.antiAliasWithSaveLayer,
  );
}
