import 'package:flutter/material.dart';
import 'package:islami_app/home/tabs/ahadeeth_tab.dart';
import 'package:islami_app/home/tabs/dates_tab.dart';
import 'package:islami_app/home/tabs/quran_tab.dart';
import 'package:islami_app/home/tabs/radio_tab.dart';
import 'package:islami_app/home/tabs/sebha_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/${getBackgroundImageName()}.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value) {
            currentIndex = value;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              icon: buildBottomNavIcon("quran", 0),
              label: "Quran",
            ),
            BottomNavigationBarItem(
              icon: buildBottomNavIcon("ahadeth", 1),
              label: "Hadith",
            ),
            BottomNavigationBarItem(
              icon: buildBottomNavIcon("sebha", 2),
              label: "Tasbeeh",
            ),
            BottomNavigationBarItem(
              icon: buildBottomNavIcon("radio", 3),
              label: "Radio",
            ),
            BottomNavigationBarItem(
              icon: buildBottomNavIcon("dates", 4),
              label: "Time",
            ),
          ],
        ),
        body:Column(
          children: [
            Image.asset("assets/images/header.png"),
            Expanded(child: tabs[currentIndex]),
          ],
        ),
      ),
    );
  }


  List<Widget> tabs = [
    QuranTab(),
    AhadeethTab(),
    SebhaTab(),
    RadioTab(),
    DatesTab()
  ];
  Widget buildBottomNavIcon(String imageName, int index) {
    return currentIndex == index
        ? Container(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
            decoration: BoxDecoration(
              color: Color(0x20202099),
              borderRadius: BorderRadius.circular(66),
            ),
            child: ImageIcon(AssetImage("assets/images/$imageName.png")))
        : ImageIcon(AssetImage("assets/images/$imageName.png"));
  }

  String getBackgroundImageName() {
    switch (currentIndex) {
      case 0:
        return "Background";
      case 1:
        return "hadeeth_bg";
      case 2:
        return "sebha_bg";
      case 3:
        return "radio_bg";
      case 4:
        return "time_bg";
      default:
        return "Background";
    }
  }
}
