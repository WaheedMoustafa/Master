import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami_app/providers/language_provider.dart';
import 'package:islami_app/providers/theme_provider.dart';
import 'package:islami_app/ui/screens/home/ahadeth/ahadeth.dart';
import 'package:islami_app/ui/screens/home/ahadeth/ahadeth_content.dart';
import 'package:islami_app/ui/screens/home/home_scr.dart';
import 'package:islami_app/ui/screens/home/quran/quran.dart';
import 'package:islami_app/ui/screens/home/quran/quran_content.dart';
import 'package:islami_app/ui/screens/home/radio/radio.dart';
import 'package:islami_app/ui/screens/home/sebha/sebha.dart';
import 'package:islami_app/ui/screens/home/settings/settings.dart';
import 'package:islami_app/ui/screens/splash_scr.dart';
import 'package:islami_app/ui/utils/styles_app.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool themPref =    prefs.getBool('isDark') ?? false ;
  String langPref =  prefs.getString('language') ?? 'en';

  runApp(
      ChangeNotifierProvider(
        create: (context)=> ThemeProvider(pref: themPref),
        child: ChangeNotifierProvider(
        create : (context)=> LanguageProvider(pref: langPref),
        child: const MyApp()),
      ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of(context);
    LanguageProvider languageProvider = Provider.of(context);

    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('ar'), // Spanish
      ],
      locale: Locale(languageProvider.currentLanguage),
      theme: AppStyles.lightTheme,
      darkTheme: AppStyles.darkTheme,
      themeMode: themeProvider.currentThemeMode,
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScr.routeName,
      routes: {
        HomeScr.routeName : (_)=> HomeScr(),
        SplashScr.routeName : (_)=> SplashScr(),
        Sebha.routeName  : (_)=> Sebha(),
        Ahadeth.routeName  : (_)=> Ahadeth(),
        Quran.routeName  : (_)=> Quran(),
        RadioIslami.routeName  : (_)=> RadioIslami(),
        QuranContent.routeName  : (_)=> QuranContent(),
        HadethContent.routeName : (_)=> HadethContent(),
        IslamiSettings.routeName : (_)=> IslamiSettings(),
      },
    );
  }
}