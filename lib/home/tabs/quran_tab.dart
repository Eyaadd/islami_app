import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/home/tabs/quran_tab_sura_list_items_horizontally.dart';
import 'package:islami_app/home/tabs/quran_tab_sura_list_items_vertically.dart';
import 'package:islami_app/sura_details/sura_details.dart';

import '../../models/sura_model.dart';

class QuranTab extends StatefulWidget {
  QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  var searchController = TextEditingController();

  @override
  void initState() {
    searchController.addListener(onSearch);
    super.initState();
  }

  onSearch() {
    SuraModel.searchResult.clear();
    String text = searchController.text;
    if (text.isNotEmpty) {
      for (String data in SuraModel.suraNamesEn) {
        if (data.toLowerCase().contains(text.toLowerCase())) {
          SuraModel.searchResult.add(data);
        }
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          searchItem(),
          SizedBox(height: 10),
          if (SuraModel.searchResult.isEmpty &&
              searchController.text.isEmpty) ...[suraListItemsHorizontal()],
          suraListItemsVertical()
        ],
      ),
    );
  }

  Widget suraListItemsHorizontal() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text(
            "Most Recently ",
            style: GoogleFonts.elMessiri(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          Container(
            height: 150,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return SuraListItemsHorizontally(
                    model: SuraModel.getSuraModel(index),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(width: 10),
                itemCount: SuraModel.length),
          )
        ]);
  }

  Widget suraListItemsVertical() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 10),
          Text("Suras List ",
              style: GoogleFonts.elMessiri(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              )),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, SuraDetails.routeName,
                              arguments: SuraModel.getSuraModel(index));
                        },
                        child: SuraListItems(
                          model: searchController.text.isNotEmpty
                              ? SuraModel.getSelectedSuraModel(index)
                              : SuraModel.getSuraModel(index),
                        ),
                      ));
                },
                separatorBuilder: (context, index) => Divider(
                      endIndent: 40,
                      indent: 40,
                    ),
                itemCount: searchController.text.isNotEmpty
                    ? SuraModel.searchResult.length
                    : SuraModel.length),
          )
        ],
      ),
    );
  }

  Widget searchItem() {
    return TextField(
      controller: searchController,
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: "Sura Name",
        hintStyle: GoogleFonts.elMessiri(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
        prefixIcon: Image.asset(
          "assets/images/ic_pre_search.png",
          color: Color(0xFFE2BE7F),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Color(0xFFE2BE7F)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Color(0xFFE2BE7F)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Color(0xFFE2BE7F)),
        ),
      ),
    );
  }
}
