import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:islami_app/data/model/radio_response.dart';
import 'package:islami_app/data/model/radios.dart';
import 'package:islami_app/ui/screens/home/radio/widget/radio_item.dart';


class RadioIslami extends StatelessWidget {
   RadioIslami({super.key});
  static const String routeName = 'radio';
  AudioPlayer audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getRadio(),
        builder: (context ,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(),);
          }
          else if (snapshot.hasError){
            return ErrorWidget('Something went wrong');
          }
          else{
          List<Radios> radio = snapshot.data! ;
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: radio.length,
              itemBuilder: (context , index){
                return RadioItem(radios :radio[index] , player: audioPlayer,);
              });
          }
        },


    );
  }

  Future< List<Radios>> getRadio () async{
    try{
      Uri uri = Uri.parse('https://mp3quran.net/api/v3/radios');
      Response response = await get(uri);
      var json = jsonDecode(response.body);
      RadioResponse radioResponse = RadioResponse.fromJson(json);
      return radioResponse.radios ?? [] ;
    }catch(e){
      throw e.toString() ;
    }
  }
}
