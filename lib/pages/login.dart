import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

import 'chatroom.dart';

const users = const {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};

class LoginPage extends StatelessWidget {
  static final sName = "/login";

  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) async {
    print('Name: ${data.name}, Password: ${data.password}');
    await Future.delayed(loginTime);
    if (!users.containsKey(data.name)) {
      return 'Username not exists';
    }
    if (users[data.name] != data.password) {
      return 'Password does not match';
    }
    return null;
  }

  Future<String?> _recoverPassword(String name) async {
    print('Name: $name');
    await Future.delayed(loginTime);
    if (!users.containsKey(name)) {
      return 'Username not exists';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      onLogin: _authUser,
      onSignup: _authUser,
      logo: "assets/hiyaya512.png",
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => ChatRoomPage(),
        ));
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
