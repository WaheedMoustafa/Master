import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier{
  String pref;
  LanguageProvider({required this.pref});

  late String currentLanguage = pref;

  set setNewLanguage(String newLanguage){
    currentLanguage = newLanguage;
    _saveData();
    notifyListeners();
  }

  Future <void> _saveData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('language',currentLanguage);

  }

}