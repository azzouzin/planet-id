import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plantid/Views/Compenants/constants.dart';
import 'package:plantid/Views/Compenants/my_button.dart';
import 'package:plantid/Views/Farm/info_page.dart';

class StudyPage extends StatefulWidget {
  const StudyPage({super.key});

  @override
  State<StudyPage> createState() => _StudyPageState();
}

class _StudyPageState extends State<StudyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "دراسة",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
          SearchBar(
            leading: Icon(Icons.search),
            constraints: BoxConstraints(
              maxWidth: Get.width * 0.9,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Mybutton(
                text: "كتب",
                function: () {},
                iconData: Icons.book_outlined,
              ),
              Mybutton(
                text: "مقالات",
                function: () {},
                iconData: Icons.document_scanner,
              ),
              Mybutton(
                text: "ابحاث",
                function: () {},
                iconData: Icons.search_outlined,
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Mybutton(
                text: "الدعم",
                function: () {},
                iconData: Icons.support,
              ),
              Mybutton(
                text: "عن التطبيق",
                function: () {
                  Get.to(InfoPage());
                },
                iconData: Icons.info,
              ),
            ],
          ),
          SizedBox(height: 100),
        ],
      ),
    );
  }
}
