import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/ui/utils/color_app.dart';
import '../../../models/screen_arg.dart';
import '../../../utils/images_app.dart';



class QuranContent extends StatefulWidget {
   QuranContent({super.key});
   static const String routeName = 'quran content';

  @override
  State<QuranContent> createState() => _QuranContentState();
}

class _QuranContentState extends State<QuranContent> {
   String suraContent = '' ;
   late ScreenArgs args ;

  @override

  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as ScreenArgs;
    if(suraContent.isEmpty){
      fileContent();
    }
    return Container(
      decoration:  const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.defaultImg),
          )
      ),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.transparent,
          title: Text('${args.name}',style: TextStyle(fontSize: 35),),
        ),
        body: Container(
          width: 354,
          height: 652,
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: Colors.white,
          ),
          child: SingleChildScrollView(
            child: Text(suraContent,
              style: TextStyle(fontSize: 20 , fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              ),
          ),
        ),),
    );
  }

   Future<void> fileContent () async{
     String suraContent1 = await rootBundle.loadString("assets/assets/${args.fileName}");
     //assets/assets/1.txt
     setState(() {
       suraContent = suraContent1 ;
       List<String> suraLines = suraContent.split('\n');
       for(int i = 0 ; i < suraLines.length ;i++){
         suraLines[i] += "(${i+1})";
         suraContent = suraLines.join("");
       }

     });

   }
}
