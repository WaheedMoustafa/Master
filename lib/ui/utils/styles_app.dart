import 'package:flutter/material.dart';
import 'color_app.dart';

class AppStyles{

      static const TextStyle appBarText = TextStyle(color: AppColors.accent, fontSize: 30 , fontWeight: FontWeight.bold);
      static const TextStyle titles = TextStyle(color: AppColors.accent, fontSize: 25 , fontWeight: FontWeight.w600);


      static ThemeData lightTheme = ThemeData(
            scaffoldBackgroundColor: AppColors.transparent ,
            primaryColor: AppColors.primary,
            appBarTheme: AppBarTheme(
                  backgroundColor: AppColors.transparent,
                  titleTextStyle: appBarText.copyWith(color: AppColors.accent),
                  elevation: 0,
                  centerTitle: true ,
            ),
            textTheme: TextTheme(
                  displayLarge: titles.copyWith(color: AppColors.accent),
            ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: AppColors.accent
      )
      );

      static ThemeData darkTheme = ThemeData(
          scaffoldBackgroundColor: AppColors.transparent ,
          primaryColor: AppColors.primaryDark,
          appBarTheme: AppBarTheme(
                backgroundColor: AppColors.transparent,
                titleTextStyle: appBarText.copyWith(color: AppColors.accentDark),
                elevation: 0,
                centerTitle: true ,
          ),
          textTheme: TextTheme(
                displayLarge: titles.copyWith(color: AppColors.accentDark),
          ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: AppColors.accentDark
        )

      );



}