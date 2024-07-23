import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/ui/models/constants.dart';
import 'package:islami_app/ui/screens/home/quran/quran_content.dart';
import 'package:islami_app/ui/utils/color_app.dart';
import 'package:islami_app/ui/utils/images_app.dart';

import '../../../models/screen_arg.dart';


class Quran extends StatefulWidget {
   Quran({super.key});
  static const String routeName = 'quran';

  @override
  State<Quran> createState() => _QuranState();
}

class _QuranState extends State<Quran> {

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        buildImage(),
        Expanded(
          flex: 7,
          child: Stack(
            alignment: Alignment.center,
              children:[
                Column(
                  children: [
                    buildDivider(),
                    const Row(children: [
                      Expanded(child: Text('Sura Name',style: TextStyle(color: AppColors.accent,fontSize: 20),textAlign: TextAlign.center,)),
                      Expanded(child: Text('Verses Number',style: TextStyle(color: AppColors.accent,fontSize: 20),textAlign: TextAlign.center,)),
                    ],),
                    buildDivider(),
                    buildSuraList(),
                  ],
                ),


                VerticalDivider(thickness: 3,color: AppColors.primary,indent: 9,)

              ]

          ),
        ),




      ],
      );

  }
  Expanded buildSuraList()=> Expanded(
    flex: 7,
    child: ListView.builder(
      itemCount: Constants.suraNames.length,
      itemBuilder: (context , index){
        return InkWell(
          onTap: (){
            ScreenArgs arguments = ScreenArgs(
                fileName:"${index+1}.txt" ,
                name:Constants.suraNames[index] );
            Navigator.pushNamed(context, QuranContent.routeName,arguments: arguments);

          },
          child: Row(
            children: [
              Expanded(child: Text(Constants.suraNames[index],
                style: TextStyle(color: AppColors.accent,fontSize: 20),textAlign: TextAlign.center,)),
              Expanded(child: Text(Constants.versesNumber[index].toString(),
                style: TextStyle(color: AppColors.accent,fontSize: 20),textAlign: TextAlign.center,)),
            ],
          ),
        );
      }

  ),);
  Divider buildDivider()=> const Divider(thickness: 3,color: AppColors.primary,);
  Expanded buildImage()=> Expanded(flex : 3 , child: Container(child: Image(image: AssetImage(AppImages.quranScr))));






}
