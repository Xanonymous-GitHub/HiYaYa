import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import './pages/home.dart';
import './pages/login.dart';
import './pages/lobby.dart';
import './pages/chatroom.dart';

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
      initialRoute: HomePage.sName,
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
        ),
        GetPage(
          name: LobbyPage.sName,
          page: () => LobbyPage(),
          transition: Transition.fadeIn,
        ),
        GetPage(
          name: ChatRoomPage.sName,
          page: () => ChatRoomPage(),
          transition: Transition.fadeIn,
        ),
      ],
    );
  }
}
