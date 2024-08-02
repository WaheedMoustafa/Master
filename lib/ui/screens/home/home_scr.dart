import 'package:flutter/material.dart';
import 'package:islami_app/extensions/extension.dart';
import 'package:islami_app/providers/theme_provider.dart';
import 'package:islami_app/ui/models/app_bar.dart';
import 'package:islami_app/ui/screens/home/quran/quran.dart';
import 'package:islami_app/ui/screens/home/radio/radio.dart';
import 'package:islami_app/ui/screens/home/sebha/sebha.dart';
import 'package:islami_app/ui/screens/home/settings/settings.dart';
import 'package:islami_app/ui/utils/color_app.dart';
import 'package:islami_app/ui/utils/images_app.dart';
import 'package:provider/provider.dart';
import 'ahadeth/ahadeth.dart';

class HomeScr extends StatefulWidget {
   HomeScr({super.key});
   static const String routeName = 'home';

  @override
  State<HomeScr> createState() => _HomeScrState();
}

class _HomeScrState extends State<HomeScr> {
   int selectedIndex = 0 ;
   List<Widget> tabs = [Quran() , Ahadeth() ,Sebha() ,RadioIslami(),IslamiSettings()];
   late ThemeProvider themeProvider ;

   @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);

    return Container(
      decoration:  BoxDecoration(
        image: DecorationImage(
          image: AssetImage( themeProvider.isDarkThemeEnabled ?AppImages.darkBG:AppImages.defaultImg),
        )
      ),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: AppBar(
          title:  Center(
              child:  Text(context.appLocalizations.islami ,
                style: TextStyle(color: themeProvider.isDarkThemeEnabled? AppColors.white : AppColors.accent,
                    fontSize: 30 ,fontWeight: FontWeight.w500),textAlign: TextAlign.center,)),
          backgroundColor: AppColors.transparent,
          elevation: 0,
        ) ,
        bottomNavigationBar :  Theme(
          data: Theme.of(context).copyWith(canvasColor: themeProvider.primary),
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index){
              setState(() {
                selectedIndex = index ;
              });
            },
            selectedFontSize: 25,
            items:  [
              BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppImages.icQuran)), label: context.appLocalizations.quran),
              BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppImages.icHadeth)), label: context.appLocalizations.ahadeth),
              BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppImages.icSebha)), label: context.appLocalizations.sebha),
              BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppImages.icRadio)), label: context.appLocalizations.radio),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: context.appLocalizations.settings),

            ],




          ),
        ),
        body: tabs[selectedIndex],

      ),
    );
  }
}
