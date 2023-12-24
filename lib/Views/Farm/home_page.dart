import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plantid/Controller/controller.dart';
import 'package:plantid/Views/Compenants/constants.dart';
import 'package:plantid/Views/Farm/farming_page.dart';
import 'package:plantid/Views/Farm/study_page.dart';

import '../Weather/homePage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;
  Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green,
        title: const Text(apptitle, style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: GetBuilder<Controller>(builder: (controller) {
        return controller.index == 0
            ? FarmingPage()
            : controller.index == 2
                ? HomePage()
                : StudyPage();
      }),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (value) {
            setState(() {
              index = value;
            });
            controller.changeindex(value);
          },

          // elevation: 20,
          selectedItemColor: green,
          // backgroundColor: Color.fromARGB(255, 216, 218, 216),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.agriculture_outlined,
                ),
                label: 'مزارع'),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: 'دراسة'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.sunny,
                ),
                label: 'الطقس'),
          ]),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        tooltip: 'Increment',
        backgroundColor: green,
        child: const Icon(
          Icons.camera,
          color: Colors.white,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
