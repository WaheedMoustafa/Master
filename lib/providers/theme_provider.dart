import 'package:flutter/material.dart';
import 'package:islami_app/ui/utils/color_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  bool pref ;

  ThemeProvider({required  this.pref});

  late ThemeMode currentThemeMode = pref ? ThemeMode.dark : ThemeMode.light;

  bool get isDarkThemeEnabled =>  currentThemeMode == ThemeMode.dark;

  set newTheme (ThemeMode themeMode) {
    currentThemeMode = themeMode;
    _saveTheme();
    notifyListeners();
  }

  Color get primary => isDarkThemeEnabled? AppColors.primaryDark : AppColors.primary;
  Future <void> _saveTheme() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDark' , isDarkThemeEnabled);

  }



}