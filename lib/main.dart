import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import './pages/home.dart';
import './pages/login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(
          name: HomePage.sName,
          page: () => HomePage(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: LoginPage.sName,
          page: () => LoginPage(),
          transition: Transition.fadeIn,
        )
      ],
    );
  }
}
