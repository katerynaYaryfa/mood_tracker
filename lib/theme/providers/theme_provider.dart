import 'package:flutter/material.dart';
import 'package:mood_tracker/theme/theme.dart';

enum ThemeType { mainTheme, greenTheme }

class ThemeProvider extends ChangeNotifier {
  ThemeData currentTheme = mainTheme;
  ThemeType themeType = ThemeType.mainTheme;

  void toggleTheme(ThemeType type) {
    currentTheme = getTheme(type);
    themeType = type;
    notifyListeners();
  }

  ThemeData getTheme(ThemeType type) {
    switch (type) {
      case ThemeType.mainTheme:
        return mainTheme;
      case ThemeType.greenTheme:
        return greenTheme;
    }
  }
}
