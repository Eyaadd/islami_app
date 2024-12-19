import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/models/sura_model.dart';


class SuraListItemsHorizontally extends StatelessWidget {
  SuraModel model;

  SuraListItemsHorizontally({required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          color: Color(0xFFE2BE7F), borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Column(
            children: [
              SizedBox(
                height: 12,
              ),
              Text(model.namesEn,
                  style: GoogleFonts.elMessiri(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF202020),
                  )),
              Text(model.namesAr,
                  style: GoogleFonts.elMessiri(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF202020),
                  )),
              SizedBox(
                height: 8,
              ),
              Text("${model.numOfVerses} Verses",
                  style: GoogleFonts.elMessiri(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF202020),
                  )),
            ],
          ),
          SizedBox(width: 30),
          Image.asset("assets/images/quran_sura.png")
        ],
      ),
    );
  }
}
