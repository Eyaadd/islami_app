import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/models/sura_model.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = "SuraDetails";

  SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if (verses.isEmpty) {
      loadFile(model.index + 1);
    }
    return Scaffold(
     backgroundColor: Color(0xFF202020),
      appBar: AppBar(
        title: Text(model.namesEn),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            "assets/images/details_bg.png",
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Text(
                  model.namesAr,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              SizedBox(height: 32),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 22),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(
                              color: Theme.of(context).primaryColor,
                            )),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text.rich(
                              textAlign: TextAlign.center,
                              TextSpan(children: [
                                TextSpan(
                                  text: "${verses[index]}",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                TextSpan(
                                  text: "[${index + 1}]",
                                  style: Theme.of(context).textTheme.bodySmall,
                                )
                              ])),
                        ),
                      );
                    },
                    itemCount: verses.length,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  loadFile(int index) async {
    String file = await rootBundle.loadString("assets/files/$index.txt");
    List<String> lines = file.split("\n");
    verses = lines;
    print(lines);
    setState(() {});
  }
}
