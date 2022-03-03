import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;

  final ThemeData customLight = ThemeData.light().copyWith(
      colorScheme: ColorScheme.dark()
          .copyWith(background: Colors.white, secondary: Colors.blue));

  late ThemeData _currentTheme = customLight;

  bool get darkTheme => _darkTheme;
  bool get customTheme => _customTheme;

  ThemeData get currentTheme => _currentTheme;

  ThemeChanger(int theme) {
    switch (theme) {
      case 1: //light
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = customLight;
        break;
      case 2: // Dark
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark();
        break;
      case 3: // Theme Custom
        _darkTheme = false;
        _customTheme = true;
        _currentTheme = ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark().copyWith(
                background: Color(0xff16202b), secondary: Colors.red));
        break;

      default:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = customLight;
        break;
    }
  }

  set darkTheme(bool value) {
    _customTheme = false;
    _darkTheme = value;

    if (value) {
      _currentTheme = ThemeData.dark();
    } else {
      _currentTheme = customLight;
    }
    notifyListeners();
  }

  set customTheme(bool value) {
    _darkTheme = false;
    _customTheme = value;

    if (value) {
      _currentTheme = ThemeData.dark().copyWith(
          colorScheme: ColorScheme.dark()
              .copyWith(background: Color(0xff16202b), secondary: Colors.red));
    } else {
      _currentTheme = ThemeData.light();
    }
    notifyListeners();
  }
}
