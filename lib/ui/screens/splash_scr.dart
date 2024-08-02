import 'dart:async';
import 'package:flutter/material.dart';
import 'package:islami_app/providers/language_provider.dart';
import 'package:islami_app/providers/theme_provider.dart';
import 'package:islami_app/ui/screens/home/home_scr.dart';
import 'package:islami_app/ui/utils/images_app.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashScr extends StatefulWidget {
  const SplashScr({super.key});
  static const String routeName = 'splash';

  @override
  State<SplashScr> createState() => _SplashScrState();
}

class _SplashScrState extends State<SplashScr> {
  late ThemeProvider themeProvider ;
  late LanguageProvider languageProvider ;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), (){
      Navigator.pushReplacementNamed(context, HomeScr.routeName);
    } );
  }

  @override

  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);
    languageProvider = Provider.of(context);
    return Scaffold(
      body: Image.asset(themeProvider.isDarkThemeEnabled ? AppImages.splashDark:AppImages.splash),

    );
  }

}
