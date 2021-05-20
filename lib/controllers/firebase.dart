import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseController extends GetxController {
  static FirebaseController get to => Get.find();

  late final FirebaseApp firebaseApp;
  late final FirebaseAuth auth;

  @override
  Future<void> onInit() async {
    this.firebaseApp = await Firebase.initializeApp();
    this.auth = FirebaseAuth.instance;
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
    return null;
  }

  Future<String?> signUp({
    required String email,
    required String password,
  }) async {
    email = email.trim();
    try {
      await this.auth.createUserWithEmailAndPassword(
            email: email,
            password: password,
          );
      if (!this.auth.currentUser!.emailVerified) {
        await this.auth.currentUser!.sendEmailVerification();
      }
    } on FirebaseAuthException catch (e) {
      return e.code;
    } catch (e) {
      print(e);
      return 'Unknown error occurred';
    }
    return null;
  }
}
