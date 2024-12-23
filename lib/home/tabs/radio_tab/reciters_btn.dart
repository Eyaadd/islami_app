import 'package:flutter/material.dart';

class RecitersBtn extends StatelessWidget {
  List<String> recitersNames = [
    "Ibrahim Al-Akdar",
    "Akram Alalaqmi",
    "Majed Al-Enezi",
    "Malik shaibat Alhamed"
  ];

   RecitersBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return       Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: ListView.separated(
          itemBuilder: (context, index) {
            return Container(
              width: 300,
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: Theme.of(context).primaryColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 14),
                    child: Text(
                      recitersNames[index],
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: Colors.black),
                    ),
                  ),
                  Image.asset("assets/images/radio_btn_bg.png")
                ],
              ),
            );
          },
          itemCount: 4,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 12);
          },
        ),
      ),
    );
  }
}
