import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SuraListItems extends StatelessWidget {
  String nameAr;
  String nameEn;
  String versesNum;
  int index;

  SuraListItems(
      {required this.nameAr,
      required this.index,
      required this.nameEn,
      required this.versesNum,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            ImageIcon(
              AssetImage("assets/images/sura_number.png"),
              size: 52,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text("${index + 1}",
                  style: GoogleFonts.elMessiri(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  )),
            )
          ],
        ),
        SizedBox(width: 24,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nameEn,
                style: GoogleFonts.elMessiri(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              Text(
                "$versesNum Verses",
                style: GoogleFonts.elMessiri(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Text(
          nameAr,
          style: GoogleFonts.elMessiri(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
