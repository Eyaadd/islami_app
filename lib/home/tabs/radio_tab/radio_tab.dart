import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/home/tabs/radio_tab/radio_btn.dart';
import 'package:islami_app/home/tabs/radio_tab/reciters_btn.dart';

class RadioTab extends StatefulWidget {
  RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xB3202020),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      currentIndex = 0;
                      print(currentIndex);
                      setState(() {});
                    },
                    child: Text("Radio",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: currentIndex == 0
                                ? Colors.black
                                : Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: currentIndex == 0
                          ? Theme.of(context).primaryColor
                          : Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      shadowColor: Colors.transparent,
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      currentIndex = 1;
                      print(currentIndex);
                      setState(() {});
                    },
                    child: Text("Reciters",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: currentIndex == 1
                                ? Colors.black
                                : Colors.white)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: currentIndex == 1
                          ? Theme.of(context).primaryColor
                          : Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      shadowColor: Colors.transparent,
                    ),
                  ),
                )],),
          ),
          currentIndex == 0 ? RadioBtn() : RecitersBtn()
        ],

      ),
    );
  }
}
