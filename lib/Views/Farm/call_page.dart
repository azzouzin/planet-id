import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plantid/Views/Compenants/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class AskExperts extends StatefulWidget {
  const AskExperts({super.key});

  @override
  State<AskExperts> createState() => _WorkWithUsState();
}

class _WorkWithUsState extends State<AskExperts> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  File? imageFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: mainWidget(),
      ),
    );
  }

  Column mainWidget() {
    TextEditingController name = TextEditingController();
    TextEditingController birthdate = TextEditingController();
    TextEditingController mochkila = TextEditingController();
    TextEditingController tafasil = TextEditingController();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: title('استشاري', Iconsax.activity),
        ),
        textField('الاسم و اللقب', name, Icons.person),
        verticalpadding,
        textField('رقم الهاتف', birthdate, Icons.phone),
        verticalpadding,
        textField('نوع المشكلة', mochkila, Icons.email),
        verticalpadding,
        textField('تفاصيل المشكلة', tafasil, Icons.email),
        verticalpadding,
        InkWell(
          onTap: () {
            setState(() {
              _openImagePicker();
            });
            setState(() {});
          },
          child: Container(
            width: 500 * 0.9,
            height: Get.height * 0.15,
            decoration: BoxDecoration(
                border: Border.all(width: 0.5, color: Colors.grey),
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 2,
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 2,
                      offset: const Offset(0, 5))
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: Text(imageFile == null
                  ? 'اظغط هنا لتحميل صورة '
                  : 'تم تحميل الصورة'),
            ),
          ),
        ),
        Expanded(child: SizedBox()),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: green,
                fixedSize: Size(500 * 0.9, Get.height * 0.075),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: () {
              openWhatsapp(
                  context: context,
                  number: phone,
                  text: name.text + mochkila.text + tafasil.text);
              Get.back();
              /*  Get.snackbar(
                'تم إرسال طلبك بنجاح ',
                'سنقوم برد عليك في أقرب  وقت',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.greenAccent.withOpacity(0.5),
              );*/
            },
            child: Text(
              'إرسال',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 20),
            )),
        verticalpadding,
      ],
    );
  }

  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      imageFile = File(pickedImage.path);
      // Do something with the image file
    }
  }

  Row title(String t, IconData iconData) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          t,
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: green),
        ),
        SizedBox(
          width: 10,
        ),
        Icon(
          iconData,
          color: green,
        ),
      ],
    );
  }

  Padding textField(
      String tit, TextEditingController editingController, IconData iconData) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          title(tit, iconData),
          Container(
            width: 500 * 0.9,
            height: 50,
            decoration: BoxDecoration(
                border: Border.all(width: 0.5, color: Colors.grey),
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 1,
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 2,
                      offset: const Offset(0, 5))
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)),
            child: TextField(
              controller: editingController,
              decoration: InputDecoration(
                fillColor: Colors.white,
                focusColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    )),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    width: 2,
                    color: green,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void openWhatsapp(
      {required BuildContext context,
      required String text,
      required String number}) async {
    var whatsapp = number; //+92xx enter like this
    var whatsappURlAndroid =
        "whatsapp://send?phone=" + whatsapp + "&text=$text";
    var whatsappURLIos = "https://wa.me/$whatsapp?text=${Uri.tryParse(text)}";
    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunchUrl(Uri.parse(whatsappURLIos))) {
        await launchUrl(Uri.parse(
          whatsappURLIos,
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Whatsapp not installed")));
      }
    } else {
      // android , web
      if (await canLaunchUrl(Uri.parse(whatsappURlAndroid))) {
        await launchUrl(Uri.parse(whatsappURlAndroid));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Whatsapp not installed")));
      }
    }
  }
}
