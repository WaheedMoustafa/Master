import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/ui/utils/color_app.dart';

class appsBarr {

  static AppBar generalAppBar = AppBar(
    title:  Center(
        child:  Text('Islami' , style: TextStyle(fontSize: 30 ,fontWeight: FontWeight.w500),textAlign: TextAlign.center,)),
    backgroundColor: AppColors.transparent,
    elevation: 0,
  );
}