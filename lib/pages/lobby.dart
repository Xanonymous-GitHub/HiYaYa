import 'package:flutter/material.dart';

import '../components/svg_icon.dart';

class LobbyPage extends StatelessWidget {
  static final sName = "/lobby";

  const LobbyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SvgIcon(
                svgName: "hiyaya",
                height: 32,
              ),
            ),
            Text(
              "All chatroom",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
