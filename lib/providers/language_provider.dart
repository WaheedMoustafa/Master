import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier{
  String currentLanguage = "en";

  set setNewLanguage(String newLanguage){
    currentLanguage = newLanguage;
    notifyListeners();
  }

   LanguageProvider({required String pref});

}