import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

import 'package:get/get.dart';

import 'lobby.dart';
import '../controllers/firebase.dart';

const users = const {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
  '1@1.1': '11111'
};

class LoginPage extends StatelessWidget {
  static final sName = "login";

  Duration get loginTime => Duration(milliseconds: 0);

  Future<String?> _authUser(LoginData data) async {
    return FirebaseController.to.signIn(
      email: data.name,
      password: data.password,
    );
  }

  Future<String?> _createUser(LoginData data) async {
    return FirebaseController.to.signUp(
      email: data.name,
      password: data.password,
    );
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
      onSignup: _createUser,
      logo: "assets/hiyaya512.png",
      onSubmitAnimationCompleted: () async {
        await Get.offAllNamed(LobbyPage.sName);
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
