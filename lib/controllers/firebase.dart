import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recase/recase.dart';

import '../types/user.dart';
import '../api/user.dart';

class FirebaseController extends GetxController {
  static FirebaseController get to => Get.find();

  late final UserData? _userData;

  UserData? get userData => this._userData;

  late final FirebaseApp firebaseApp;
  late final FirebaseAuth auth;
  late final FirebaseFirestore store;

  @override
  Future<void> onInit() async {
    this.firebaseApp = await Firebase.initializeApp();
    this.auth = FirebaseAuth.instance;
    this.store = FirebaseFirestore.instance;
    super.onInit();
  }

  Future<String?> signIn({
    required String email,
    required String password,
  }) async {
    email = email.trim();
    if (email.isEmpty) return null;
    try {
      await this.auth.signInWithEmailAndPassword(
            email: email,
            password: password,
          );
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
    await this.fetchUserData();
    print(this._userData);
    return null;
  }

  Future<String?> signUp({
    required String email,
    required String password,
  }) async {
    email = email.trim();
    try {
      await requestCreateUser(new UserToCreate(
        email: email,
        password: password,
      ));
    } on DioError catch (e) {
      return e.response!.data;
    }
    await this.auth.currentUser!.sendEmailVerification();
    await signIn(email: email, password: password);
    return null;
  }

  Future<void> fetchUserData() async {
    final result = (await this
            .store
            .collection('/users')
            .doc(this.auth.currentUser!.uid)
            .get())
        .data();
    final Map<String, dynamic> userDataMap = {};
    result!.forEach((key, value) => userDataMap[key.snakeCase] = value);
    this._userData = UserData.fromJson(userDataMap);
  }
}
