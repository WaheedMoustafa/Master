import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/ui/utils/color_app.dart';
import '../../../models/screen_arg.dart';
import '../../../utils/images_app.dart';



class HadethContent extends StatefulWidget {
  HadethContent({super.key});
  static const String routeName = 'hadeth content';

  @override
  State<HadethContent> createState() => _HadethContentState();
}

class _HadethContentState extends State<HadethContent> {
  String hadethContent = '' ;
  late ScreenArgs args ;

  @override

  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as ScreenArgs;
    if(hadethContent.isEmpty){
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
            child: Text(hadethContent,
              style: TextStyle(fontSize: 20 , fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
            ),
          ),
        ),),
    );
  }

  Future<void> fileContent () async{
    String hadethContent1 = await rootBundle.loadString("assets/quran/hadeth/h${args.fileName}");
    //assets/quran/hadeth/h1.txt
    setState(() {
      hadethContent = hadethContent1 ;


    });

  }
}
