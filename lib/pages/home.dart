import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login.dart';

import '../components/svg_icon.dart';

import '../controllers/firebase.dart';

class HomePage extends StatelessWidget {
  static final sName = "home";

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: SvgIcon(
                  svgName: "hiyaya",
                  width: Get.width * 0.618,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "HiYaYa",
                  style: TextStyle(
                    fontSize: Get.width * 0.1236,
                    fontWeight: FontWeight.bold,
                    fontFamily: '', // TODO add custom font-family
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: GetBuilder<FirebaseController>(
                  init: FirebaseController(),
                  builder: (firebase) => ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 30,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    onPressed: () async {
                      await Get.toNamed(LoginPage.sName);
                    },
                    child: Text(
                      "Start Chat",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
