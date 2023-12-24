import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plantid/Views/Compenants/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "beIN",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green,
        title: Text(apptitle, style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "تطبيق مزرعتي يهتم بكل ما يخص المزارعين مقولى بالذكاء الاصطناعي لاكتشاف مختلف الامراض و حالة المحاصيل",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: Get.width * 0.4,
                height: Get.height * 0.15,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 5,
                        spreadRadius: 3)
                  ],
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.amber,
                ),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    SizedBox(
                      width: Get.width * 0.4,
                      height: Get.height * 0.15,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          "assets/expert.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      "استشاري المحاصيل",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: Get.width * 0.4,
                height: Get.height * 0.15,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 5,
                        spreadRadius: 3)
                  ],
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.amber,
                ),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    SizedBox(
                      width: Get.width * 0.4,
                      height: Get.height * 0.15,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          "assets/note.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      "المذكرة اليومية",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                "معرفة حالة محصولك من مواعيد تسميد و حصاد",
                style: TextStyle(fontSize: 18),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Mybutton(
                    text: "احصل على العلاج",
                    function: () {},
                  ),
                  Mybutton(
                    text: "معالجة",
                    function: () {},
                  ),
                  Mybutton(
                    text: "نتيجة",
                    function: () {},
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Text(
                "معرفة حالة محصولك و علاجه بظغطة واحدة",
                style: TextStyle(fontSize: 18),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Mybutton(
                    text: "احصل على العلاج",
                    function: () {},
                  ),
                  Mybutton(
                    text: "استكشف التشخيص",
                    function: () {},
                  ),
                  Mybutton(
                    text: "التقط صورة",
                    function: () {
                      getImage();
                    },
                  ),
                ],
              ),
            ],
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          // elevation: 20,
          selectedItemColor: green,
          // backgroundColor: Color.fromARGB(255, 216, 218, 216),
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.agriculture_outlined,
                ),
                label: 'مزارع'),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: 'دراسة'),
          ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: CircleBorder(),
        tooltip: 'Increment',
        backgroundColor: green,
        child: const Icon(
          Icons.camera,
          color: Colors.white,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  }
}

class Mybutton extends StatelessWidget {
  const Mybutton({
    super.key,
    required this.text,
    required this.function,
  });
  final String text;
  final Function function;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        function();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        //  width: Get.width * 0.25,
        //height: Get.height * 0.075,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: green,
          border: Border.all(
            width: 1,
            color: Color.fromARGB(255, 173, 255, 207),
          ),
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
    );
  }
}
