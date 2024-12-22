import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static const Color primaryColor = Color(0xFFE2BE7F);
  static const Color blackColor = Color(0xFF202020);
  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      backgroundColor: blackColor,
      titleTextStyle: GoogleFonts.aBeeZee(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: primaryColor,
      ),
      centerTitle: true,
      iconTheme: IconThemeData(color: primaryColor),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: primaryColor,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      selectedItemColor: Colors.white,
      unselectedItemColor: blackColor,
      type: BottomNavigationBarType.fixed,
    ),
    textTheme: TextTheme(
      titleSmall: GoogleFonts.aBeeZee(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: primaryColor,
      ),
      titleMedium: GoogleFonts.aBeeZee(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: primaryColor,
      ),
      titleLarge: GoogleFonts.aBeeZee(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: primaryColor,
      ),
      bodySmall: GoogleFonts.elMessiri(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: primaryColor,
      ),
      bodyMedium: GoogleFonts.elMessiri(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: primaryColor,
      ),
      bodyLarge: GoogleFonts.elMessiri(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: primaryColor,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData();
}
