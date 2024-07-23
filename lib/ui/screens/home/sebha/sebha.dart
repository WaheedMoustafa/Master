import 'dart:math';
import 'package:flutter/material.dart';
import 'package:islami_app/ui/utils/color_app.dart';
import 'package:islami_app/ui/utils/images_app.dart';


class Sebha extends StatefulWidget {
  const Sebha({super.key});
  static const String routeName = 'sebha';

  @override
  State<Sebha> createState() => _SebhaState();
}

class _SebhaState extends State<Sebha> with SingleTickerProviderStateMixin{
  int counter = 0 ;
  late AnimationController controller ;
  late Animation<double> animation ;
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

               Container(child: const Text("عدد التسبيحات" ,
                style: TextStyle(color: AppColors.accent,fontSize: 25,fontWeight: FontWeight.w600),),),
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
                  counter++;
                  controller.forward(from: 0);
                });
              }, child: Text("سبحان الله" ,style: TextStyle(color: AppColors.white,fontSize: 25),)),

            ],
          ),
        ),


    );
  }
}
