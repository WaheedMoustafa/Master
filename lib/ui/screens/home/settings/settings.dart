import 'package:flutter/material.dart';
import 'package:islami_app/extensions/extension.dart';
import 'package:islami_app/providers/theme_provider.dart';
import 'package:islami_app/ui/utils/color_app.dart';
import 'package:islami_app/ui/utils/styles_app.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../providers/language_provider.dart';

class IslamiSettings extends StatefulWidget {
  const IslamiSettings({super.key});
  static const String routeName = 'IslamiSettings' ;

  @override
  State<IslamiSettings> createState() => _IslamiSettingsState();
}

class _IslamiSettingsState extends State<IslamiSettings> {
  late LanguageProvider languageProvider ;
  late ThemeProvider themeProvider ;

  @override
  Widget build(BuildContext context) {
    LanguageProvider languageProvider = Provider.of(context);
    ThemeProvider themeProvider = Provider.of(context);
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 25,),
            Text(context.appLocalizations.language ,style: TextStyle(fontSize: 35,
                color: themeProvider.isDarkThemeEnabled? AppColors.white: AppColors.accent),),
            SizedBox(height: 18,),
            DropdownButton(
              value: languageProvider.currentLanguage,
                items: [
              DropdownMenuItem(
                  value:'en',child: Text('en' ,
                style: TextStyle(color: themeProvider.isDarkThemeEnabled? AppColors.accentDark:AppColors.accent),)),
              DropdownMenuItem(value: 'ar',child: Text('ar',
                style: TextStyle(color: themeProvider.isDarkThemeEnabled? AppColors.accentDark:AppColors.accent),)),
            ],
                onChanged: (newValue){
                  languageProvider.setNewLanguage = newValue??  languageProvider.currentLanguage ;
              setState(() {
              });
                }),
            SizedBox(height: 18,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(context.appLocalizations.theme,style: TextStyle(
                    fontSize: 35,
                    color: themeProvider.isDarkThemeEnabled? AppColors.white: AppColors.accent),),
                Switch(
                    value: themeProvider.isDarkThemeEnabled,
                    onChanged: (newValue){
                      themeProvider.newTheme = newValue?ThemeMode.dark : ThemeMode.light ;
                      setState(() {

                      });
                    })
              ],
            ),
          ],
        ),
      ),
    );
  }
  void setData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDark' , themeProvider.isDarkThemeEnabled);
    prefs.setString('language',languageProvider.currentLanguage);

  }

}
