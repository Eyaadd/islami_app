import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/hadeeth_details/hadeeth_details.dart';
import 'package:islami_app/models/hadeth_model.dart';

class AhadeethTab extends StatefulWidget {
  AhadeethTab({super.key});

  @override
  State<AhadeethTab> createState() => _AhadeethTabState();
}

class _AhadeethTabState extends State<AhadeethTab> {
  List<HadethModel> ahadeeth = [];

  @override
  Widget build(BuildContext context) {
    loadHadethFile();
    return Column(
      children: [
        Expanded(
          child: CarouselSlider(
            options: CarouselOptions(height: double.infinity),
            items: ahadeeth.map((hadeeth) {
              return Builder(
                builder: (BuildContext context) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, HadeethDetails.routeName,
                          arguments: hadeeth);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 12),
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Image.asset(
                            "assets/images/hadeth_bg.png",
                            width: double.infinity,
                            fit: BoxFit.fill,
                            height: double.infinity,
                          ),
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 24),
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                child: Text(
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  hadeeth.title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(color: Colors.black),
                                ),
                              ),
                              Directionality(
                                textDirection: TextDirection.rtl,
                                child: Padding(
                                  padding: const EdgeInsets.all(22),
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 11,
                                    hadeeth.content.first,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(color: Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }

  loadHadethFile() {
    rootBundle.loadString("assets/files/ahadeth.txt").then((file) {
      List<String> ahadeth = file.split("#");
      for (String data in ahadeth) {
        List<String> lines = data.trim().split("\n");
        String hadethTitle = lines[0];
        lines.removeAt(0);
        List<String> hadethContent = lines;
        HadethModel hadethModel =
            HadethModel(title: hadethTitle, content: hadethContent);
        ahadeeth.add(hadethModel);
        setState(() {});
      }
    }).catchError((error) {
      print(error.toString());
    });
  }
}
