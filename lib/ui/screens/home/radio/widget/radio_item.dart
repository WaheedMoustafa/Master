import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/data/model/radios.dart';
import 'package:islami_app/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class RadioItem extends StatefulWidget {
  final Radios radios;
  final AudioPlayer player;
  const RadioItem({super.key,required this.radios , required this.player});

  @override
  State<RadioItem> createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {
  bool isPlayed = false;

   @override
   Widget build(BuildContext context) {
     ThemeProvider themeProvider = Provider.of(context);
     return  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/radio_image.png'),
            Center(
              child: Text(widget.radios.name??'',style:  TextStyle(fontWeight: FontWeight.w600,fontSize: 35,
                  color: themeProvider.isDarkThemeEnabled? Colors.white : const Color(0xff6A421C) ),),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: (){},
                    child:  Icon(Icons.skip_previous,size: 45,color: themeProvider.isDarkThemeEnabled?
                    Colors.white : const Color(0xff6A421C) ,)),
                InkWell(
                    onTap: (){
                      setState(() {
                        isPlayed?
                        widget.player.pause() :widget.player.play(UrlSource(widget.radios.url ?? ''));
                        isPlayed = !isPlayed ;
                      });
                    },
                    child: Icon(
                      isPlayed?  Icons.pause:  Icons.play_arrow_outlined ,
                      size: 45, color: themeProvider.isDarkThemeEnabled? Colors.white : const Color(0xff6A421C) ,)
                ),
                InkWell(
                    onTap: (){},
                    child: Icon(Icons.skip_next,size: 45,  color: themeProvider.isDarkThemeEnabled? Colors.white : const Color(0xff6A421C)  )),

              ],
            ),
          ],
        );
      }
}
