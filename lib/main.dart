import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/cache/cache_helper.dart';
import 'package:islami_app/home/home_screen.dart';
import 'package:islami_app/my_theme_data.dart';
import 'package:islami_app/onboarding_screen.dart';
import 'package:islami_app/sura_details/sura_details.dart';

import 'hadeeth_details/hadeeth_details.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: CacheHelper.getEligibility() == true ? HomeScreen.routeName : "/",
      routes: {
        OnBoardingScreen.routeName : (context) => OnBoardingScreen(),
        HomeScreen.routeName : (context) => HomeScreen(),
        SuraDetails.routeName : (context) => SuraDetails(),
        HadeethDetails.routeName : (context) => HadeethDetails(),
      },
    );
  }
}
