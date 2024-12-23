import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/models/dates_model.dart';

class DatesTab extends StatefulWidget {
  DatesTab({super.key});

  @override
  State<DatesTab> createState() => _DatesTabState();
}

class _DatesTabState extends State<DatesTab> {
  List<DatesModel> dates = [];

  @override
  Widget build(BuildContext context) {
    loadDatesModel();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset("assets/images/praytime_bg.png"),
              CarouselSlider(
                options: CarouselOptions(height: 300,
                  viewportFraction: 0.3,
                ),
                items: dates.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset("assets/images/linear_gradiant_bg.png",),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(i.sala,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(color: Colors.white)),
                                Text(i.time,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(color: Colors.white)),
                                Text(i.format,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(color: Colors.white)),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Azkar",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                width: 165,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: Theme.of(context).primaryColor, width: 2)),
                child: Column(
                  children: [
                    Image.asset("assets/images/bell_icon.png"),
                    Text(
                      "Evening Azkar",
                      style: Theme.of(context).textTheme.bodySmall,
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                width: 165,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: Theme.of(context).primaryColor, width: 2)),
                child: Column(
                  children: [
                    Image.asset("assets/images/mosque_icon.png"),
                    Text(
                      "Morning Azkar",
                      style: Theme.of(context).textTheme.bodySmall,
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  List<String> salaName = [
    "Sunrise",
    "Dhuhr",
    "Asr",
    "Maghrib",
    "Isha",
    "Fajr"
  ];

  List<String> time = ["06:00", "11:30", "02:30", "05:15", "06:30", "04:00"];

  List<String> format = ["AM", "AM", "PM", "PM", "PM", "AM"];

  loadDatesModel() {
    for (int i = 0; i < salaName.length; i++) {
      String sala = salaName[i];
      String timee = time[i];
      String formatt = format[i];
      DatesModel datesModel =
          DatesModel(sala: sala, format: formatt, time: timee);
      dates.add(datesModel);
    }
    setState(() {});
  }
}
