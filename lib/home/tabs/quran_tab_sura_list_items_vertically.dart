import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/models/sura_model.dart';

class SuraListItems extends StatelessWidget {
  SuraModel model;

  SuraListItems({required this.model, super.key});

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
              child: Text("${model.index + 1}",
                  style: GoogleFonts.elMessiri(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  )),
            )
          ],
        ),
        SizedBox(
          width: 24,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.namesEn,
                style: GoogleFonts.elMessiri(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              Text(
                "${model.numOfVerses} Verses",
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
          model.namesAr,
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
