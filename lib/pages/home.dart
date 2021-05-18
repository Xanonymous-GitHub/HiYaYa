import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/svg_icon.dart';

class Home extends StatelessWidget {
  static final sName = "home";

  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
