import 'dart:async';

import 'package:flutter/material.dart';
import 'package:islami_app/ui/screens/home/home_scr.dart';
import 'package:islami_app/ui/utils/images_app.dart';


class SplashScr extends StatefulWidget {
  const SplashScr({super.key});
  static const String routeName = 'splash';

  @override
  State<SplashScr> createState() => _SplashScrState();
}

class _SplashScrState extends State<SplashScr> {

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), (){
      Navigator.pushReplacementNamed(context, HomeScr.routeName);
    } );
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(AppImages.splash),

    );
  }
}
