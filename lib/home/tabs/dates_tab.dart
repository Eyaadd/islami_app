import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DatesTab extends StatelessWidget {
  const DatesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Dates Tab",
            style: GoogleFonts.elMessiri(fontSize: 24, color: Colors.white),
          )
        ],
      ),
    );
  }
}
