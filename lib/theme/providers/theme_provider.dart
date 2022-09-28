import 'package:flutter/material.dart';
import 'package:mood_tracker/theme/themes.dart';

enum ThemeType { mainTheme, greenTheme }

class ThemeProvider extends ChangeNotifier {
  ThemeData currentTheme = mainTheme;

  void toggleTheme(ThemeType type) {
    switch (type) {
      case ThemeType.mainTheme:
        currentTheme = mainTheme;
        break;
      case ThemeType.greenTheme:
        currentTheme = greenTheme;
        break;
    }

    notifyListeners();
  }
}
