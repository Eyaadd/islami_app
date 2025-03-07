import 'package:flutter/material.dart';
import 'package:islami_app/home_screen.dart';
import 'package:islami_app/onboarding_screen.dart';

void main(){

  runApp(MyApp());
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        OnBoardingScreen.routeName : (context) => OnBoardingScreen(),
        HomeScreen.routeName : (context) => HomeScreen(),
      },
    );
  }
}
