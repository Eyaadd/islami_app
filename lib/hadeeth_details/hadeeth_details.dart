import 'package:flutter/material.dart';
import 'package:islami_app/models/hadeth_model.dart';

class HadeethDetails extends StatelessWidget {
  static const String routeName = "HadeethDetails";

  const HadeethDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var model = ModalRoute.of(context)?.settings.arguments as HadethModel;
    return Scaffold(
      backgroundColor: Color(0xFF202020),
      appBar: AppBar(
        title: Text(model.title),
        titleTextStyle: Theme.of(context).textTheme.titleLarge,
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
              SizedBox(height: 90),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 22),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text.rich(
                            textAlign: TextAlign.center,
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "${model.content[index]}",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: model.content.length,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
