import 'package:flutter/material.dart';
import 'package:islami_app/ui/models/app_bar.dart';
import 'package:islami_app/ui/screens/home/quran/quran.dart';
import 'package:islami_app/ui/screens/home/radio/radio.dart';
import 'package:islami_app/ui/screens/home/sebha/sebha.dart';
import 'package:islami_app/ui/utils/color_app.dart';
import 'package:islami_app/ui/utils/images_app.dart';
import 'ahadeth/ahadeth.dart';

class HomeScr extends StatefulWidget {
   HomeScr({super.key});
   static const String routeName = 'home';

  @override
  State<HomeScr> createState() => _HomeScrState();
}

class _HomeScrState extends State<HomeScr> {
   int selectedIndex = 0 ;
   List<Widget> tabs = [Quran() , Ahadeth() ,Sebha() ,RadioIslami()];

   @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.defaultImg),
        )
      ),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: appsBarr.generalAppBar ,
        bottomNavigationBar :  Theme(
          data: ThemeData(
              canvasColor: AppColors.primary),
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index){
              setState(() {
                selectedIndex = index ;
              });
            },
            selectedItemColor: AppColors.accent,
            selectedFontSize: 25,
            items: const [
              BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppImages.icQuran)), label: "Quran" ),
              BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppImages.icHadeth)), label: "Ahadeth" ),
              BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppImages.icSebha)), label: "Sebha" ),
              BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppImages.icRadio)), label: "Radio" ),

            ],




          ),
        ),
        body: tabs[selectedIndex],

      ),
    );
  }
}
