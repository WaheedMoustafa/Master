import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/extensions/extension.dart';
import 'package:islami_app/providers/theme_provider.dart';
import 'package:islami_app/ui/models/constants.dart';
import 'package:islami_app/ui/screens/home/quran/quran_content.dart';
import 'package:islami_app/ui/utils/color_app.dart';
import 'package:islami_app/ui/utils/images_app.dart';
import 'package:provider/provider.dart';

import '../../../models/screen_arg.dart';
import 'ahadeth_content.dart';


class Ahadeth extends StatefulWidget {
  Ahadeth({super.key});
  static const String routeName = 'ahadeth';
  late ThemeProvider themeProvider ;

  @override
  State<Ahadeth> createState() => _AhadethState();
}

class _AhadethState extends State<Ahadeth> {

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of(context);
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
                    Row(children: [
                      Expanded(child: Text(context.appLocalizations.hadethName,
                        style: TextStyle(color: themeProvider.isDarkThemeEnabled? AppColors.white: AppColors.accent,fontSize: 20),textAlign: TextAlign.center,)),
                    ],),
                    buildDivider(),
                    Expanded(
            flex: 7,
            child: ListView.builder(
                itemCount: 49,
                itemBuilder: (context , index){
                  return InkWell(
                    onTap: (){
                      ScreenArgs arguments = ScreenArgs(
                          fileName:"${index+1}.txt" ,
                          name: context.appLocalizations.hadeth +" ${index+1}"  );
                      Navigator.pushNamed(context, HadethContent.routeName,arguments: arguments);

                    },
                    child: Row(
                      children: [
                        Expanded(child: Text(context.appLocalizations.hadeth+"${index+1}",
                          style: TextStyle(color: themeProvider.isDarkThemeEnabled? AppColors.white: AppColors.accent,fontSize: 20),textAlign: TextAlign.center,)),
                      ],
                    ),
                  );
                }

            ),),
                  ],
                ),


              ]

          ),
        ),




      ],
    );

  }
// Expanded buildSuraList()=> Expanded(
//   flex: 7,
//   child: ListView.builder(
//       itemCount: 49,
//       itemBuilder: (context , index){
//         return InkWell(
//           onTap: (){
//             ScreenArgs arguments = ScreenArgs(
//                 fileName:"${index+1}.txt" ,
//                 name: context.appLocalizations.hadeth +" ${index+1}"  );
//             Navigator.pushNamed(context, HadethContent.routeName,arguments: arguments);

//           },
//           child: Row(
//             children: [
//               Expanded(child: Text(context.appLocalizations.hadeth+"${index+1}",
//                 style: TextStyle(color: themeProvider.isDarkThemeEnabled? AppColors.white: AppColors.accent,fontSize: 20),textAlign: TextAlign.center,)),
//             ],
//           ),
//         );
//       }

//   ),);
  Divider buildDivider()=> const Divider(thickness: 3,color: AppColors.primary,);
  Expanded buildImage()=> Expanded(flex : 3 , child: Container(child: Image(image: AssetImage(AppImages.hadeth))));






}
