import 'package:flutter/material.dart';
import 'package:islami_app/ui/screens/home/ahadeth/ahadeth.dart';
import 'package:islami_app/ui/screens/home/ahadeth/ahadeth_content.dart';
import 'package:islami_app/ui/screens/home/home_scr.dart';
import 'package:islami_app/ui/screens/home/quran/quran.dart';
import 'package:islami_app/ui/screens/home/quran/quran_content.dart';
import 'package:islami_app/ui/screens/home/radio/radio.dart';
import 'package:islami_app/ui/screens/home/sebha/sebha.dart';
import 'package:islami_app/ui/screens/splash_scr.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScr.routeName,
      routes: {
        HomeScr.routeName : (_)=> HomeScr(),
        SplashScr.routeName : (_)=> SplashScr(),
        Sebha.routeName  : (_)=> Sebha(),
        Ahadeth.routeName  : (_)=> Ahadeth(),
        Quran.routeName  : (_)=> Quran(),
        RadioIslami.routeName  : (_)=> RadioIslami(),
        QuranContent.routeName  : (_)=> QuranContent(),
        HadethContent.routeName : (_)=> HadethContent(),

      },
    );
  }
}