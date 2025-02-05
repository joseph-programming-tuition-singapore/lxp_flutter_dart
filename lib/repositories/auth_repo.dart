import 'package:firebase_auth/firebase_auth.dart';

class AuthRepo {
  User? getCurrentUser() {
    return FirebaseAuth.instance.currentUser;
  }

  bool checkIsLoggedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }

  // Documentation: https://firebase.google.com/docs/auth/flutter/password-auth
  Future<String> login(String emailAddress, String password) async {
    if (FirebaseAuth.instance.currentUser != null) return 'Already signed in.';
    if (emailAddress.trim() == '') return 'Email is required.';
    if (password.trim() == '') return 'Password is required.';
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return credential.user?.uid != null ? 'OK' : 'An unknown error occurred.';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
    } catch (e) {
      return e.toString();
    }
    return 'An unknown error occurred.';
  }

  void logout() async {
    if (FirebaseAuth.instance.currentUser == null) return;
    await FirebaseAuth.instance.signOut();
  }
}
