import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SebhaTab extends StatefulWidget {
  SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  var turn = 0.0;
  int counter = 0;
  int flag = 0;
  Widget sebhaIC = Image.asset("assets/images/sebha_ic.png");
  Widget sebhaText = Text(
    "سبحان الله",
    style: GoogleFonts.elMessiri(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        children: [
          Text(
            "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.white),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              AnimatedRotation(
                  alignment: Alignment(0, 0),
                  turns: turn,
                  duration: Duration(seconds: 0),
                  child: sebhaIC),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: sebhaText,
                      onTap: () {
                        turn += 0.01;
                        flag++;
                        counter++;
                        switch (flag) {
                          case 33:
                            {
                              counter = 0;
                              sebhaText = Text("الحمد لله",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(color: Colors.white));
                            }
                          case 66:
                            {
                              counter = 0;
                              sebhaText = Text("و الله اكبر",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(color: Colors.white));
                            }
                          case 99:
                            {
                              counter = 0;
                              flag = 0;
                              sebhaText = Text("سبحان الله",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(color: Colors.white));
                            }
                        }

                        print(counter);
                        print(flag);
                        setState(() {});
                      },
                    ),
                    SizedBox(height: 20),
                    Text(
                      "$counter",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
