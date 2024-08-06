import 'dart:math';
import 'package:flutter/material.dart';
import 'package:islami_app/extensions/extension.dart';
import 'package:islami_app/providers/theme_provider.dart';
import 'package:islami_app/ui/utils/color_app.dart';
import 'package:islami_app/ui/utils/images_app.dart';
import 'package:provider/provider.dart';


class Sebha extends StatefulWidget {
  const Sebha({super.key});
  static const String routeName = 'sebha';

  @override
  State<Sebha> createState() => _SebhaState();
}

class _SebhaState extends State<Sebha> with SingleTickerProviderStateMixin{
  int counter = 0 ;
  List<String> zekrList = ["سبحان الله" , "الحمدلله" , " الله اكبر " , " لا حول ولا قوة إلا بالله" , " "];
  int index = 0 ;
  late AnimationController controller ;
  late Animation<double> animation ;
  late ThemeProvider themeProvider ;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: 1));
        setRotation(180);
  }

  void setRotation (int degree){
    final angle = (degree * pi) / 180;
    animation = Tween<double> (begin: 0 , end: angle).animate(controller);

  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of(context);
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Stack(
                children :
                [
                  Container(
                    height: 400,
                    child: AnimatedBuilder(
                      animation: animation,
                        builder: (context , child) =>Transform.rotate(
                            angle: animation.value,
                            child: Image(image: AssetImage(AppImages.sebhaLogo),))),
                  ),
                  Positioned(
                    right: 140,
                    top: 5,
                    child: Container(
                        child: Image(image: AssetImage(AppImages.headSebhaLogo),)),
                  ),

                ]
              ),

               Container(child:  Text(context.appLocalizations.tasbeehNum ,
                style: TextStyle(color: themeProvider.isDarkThemeEnabled? AppColors.white: AppColors.accent,fontSize: 25,fontWeight: FontWeight.w600),),),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xffC6B294),
                  borderRadius: BorderRadius.circular(25)

                ),
                height: 70,
                width: 60,
                child: Center(child: Text("$counter",
                  style: TextStyle(color: AppColors.accent,fontSize: 25,fontWeight: FontWeight.w400),textAlign: TextAlign.center,)),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
                  onPressed: (){
                setState(() {
                  countIndex() ;
                  controller.forward(from: 0);

                });

              }, child: Text( zekrList[index] ,style: TextStyle(color: AppColors.white,fontSize: 25),)),
            ],
          ),
        ),
    );
  }

  void countIndex(){
    counter++;
    if(counter >= 34){
      counter = 0;
      index++;
      if( index > 3){
       index = 0 ;
     }
    }

  //  counter >= 33 ?
  //  index < zekrList.length-1 ?
  //   counter = 0 & index++ : index = 0
  //      : counter ++ ;

  }
    }


