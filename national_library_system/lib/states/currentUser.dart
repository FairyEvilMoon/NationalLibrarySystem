import 'dart:math';
import 'package:firedart/firedart.dart';

class CurrentUser {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> registerWithEmailAndPassword(
      String email, String password) async {
    final user = await _auth.signUp(
      email,
      password,
    );

    // you can also store the user in Database
  }

  Future<bool> signInWithEmailAndPassword(String email, String password) async {
    bool retVal = false;
    try {
      final user = await _auth.signIn(
        email,
        password,
      );

      if (user != null) {
        retVal = true;
      }

      // you can also store the user in Database
    } catch (e) {
      print(e);
    }
    return retVal;
  }
}
