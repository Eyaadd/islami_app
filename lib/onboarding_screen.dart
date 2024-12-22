import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami_app/cache/cache_helper.dart';
import 'package:islami_app/home/home_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  static const String routeName = "/";

  const OnBoardingScreen({super.key});

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/images/onboarding$assetName.png', width: width);
  }

  @override
  Widget build(BuildContext context) {
    var bodyStyle = GoogleFonts.elMessiri(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).primaryColor,
    );

    var pageDecoration = PageDecoration(
      titleTextStyle: GoogleFonts.elMessiri(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color:  Theme.of(context).primaryColor,
      ),
      bodyTextStyle: bodyStyle,
      bodyPadding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: const Color(0xFF202020),
      imagePadding: EdgeInsets.zero,
      imageFlex: 4,
    );
    return IntroductionScreen(
      globalHeader: Image.asset("assets/images/header.png"),
      dotsFlex: 2,
      dotsDecorator:  DotsDecorator(
        color: Color(0xFF707070),
        activeColor: Theme.of(context).primaryColor,
      ),
      globalBackgroundColor: const Color(0xFF202020),
      showDoneButton: true,
      onDone: () {
        CacheHelper.saveEligibility();
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      },
      done:  Text(
        "Finish",
        style: GoogleFonts.elMessiri(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor,
        ),
      ),
      showNextButton: true,
      next:  Text(
        "Next",
        style: GoogleFonts.elMessiri(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor
        ),
      ),
      showBackButton: true,
      back:  Text(
        "Back",
        style: GoogleFonts.elMessiri(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor,
        ),
      ),
      pages: [
        PageViewModel(
          title: "Welcome To Islmi App",
          body: "",
          image: _buildImage(''),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Welcome To Islami",
          body: "We Are Very Excited To Have You In Our Community",
          image: _buildImage('2'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Reading the Quran",
          body: "Read, and your Lord is the Most Generous",
          image: _buildImage('3'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Bearish",
          body: "Praise the name of your Lord, the Most High",
          image: _buildImage('4'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Holy Quran Radio",
          body:
              "You can listen to the Holy Quran Radio through the application for free and easily",
          image: _buildImage('5'),
          decoration: pageDecoration,
        ),
      ],
    );
  }
}
