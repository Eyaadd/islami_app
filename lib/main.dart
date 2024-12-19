import 'package:flutter/material.dart';
import 'package:islami_app/cache/cache_helper.dart';
import 'package:islami_app/home/home_screen.dart';
import 'package:islami_app/onboarding_screen.dart';

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
      initialRoute: CacheHelper.getEligibility() == true ? HomeScreen.routeName : "/",
      routes: {
        OnBoardingScreen.routeName : (context) => OnBoardingScreen(),
        HomeScreen.routeName : (context) => HomeScreen(),
      },
    );
  }
}
