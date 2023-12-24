import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../Compenants/my_button.dart';

class FarmingPage extends StatefulWidget {
  const FarmingPage({super.key});

  @override
  State<FarmingPage> createState() => _FarmingPageState();
}

class _FarmingPageState extends State<FarmingPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text(
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
                  const Text(
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
                  const Text(
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
            const Text(
              "معرفة حالة محصولك من مواعيد تسميد و حصاد",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Mybutton(
                  text: "نتيجة",
                  function: () {},
                  iconData: Icons.done_all_outlined,
                ),
                Mybutton(
                  text: "معالجة",
                  function: () {},
                  iconData: Icons.qr_code,
                ),
                Mybutton(
                  text: "التقط صورة",
                  function: () {
                    getImage();
                  },
                  iconData: Icons.camera_alt_outlined,
                ),
              ],
            ),
          ],
        ),
        Column(
          children: [
            const Text(
              "معرفة حالة محصولك و علاجه بظغطة واحدة",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Mybutton(
                  text: "احصل على العلاج",
                  function: () {},
                  iconData: Icons.done_all_outlined,
                ),
                Mybutton(
                  text: "استكشف التشخيص",
                  function: () {},
                  iconData: Icons.qr_code,
                ),
                Mybutton(
                  text: "التقط صورة",
                  function: () {
                    getImage();
                  },
                  iconData: Icons.camera_alt_outlined,
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 50),
      ],
    );
  }

  void getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
  }
}
