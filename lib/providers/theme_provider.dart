import 'package:flutter/material.dart';
import 'package:islami_app/ui/utils/color_app.dart';

class ThemeProvider extends ChangeNotifier {

  ThemeProvider({required bool pref});

  ThemeMode currentThemeMode = ThemeMode.light;

  bool get isDarkThemeEnabled =>  currentThemeMode == ThemeMode.dark;

  set newTheme (ThemeMode themeMode) {
    currentThemeMode = themeMode;
    notifyListeners();
  }

  Color get primary => isDarkThemeEnabled? AppColors.primaryDark : AppColors.primary;



}