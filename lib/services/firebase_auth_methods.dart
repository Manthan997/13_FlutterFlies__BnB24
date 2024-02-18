import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseAuthMethods {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // for now we will pass the instance via constructor
  final FirebaseAuth _auth;
  FirebaseAuthMethods(this._auth);

//state persistance
  Stream<User?> get authState => _auth.authStateChanges();

  // Future<User?> signInWithGoogle() async {
  //   try {
  //     final GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();
  //     final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;
  //     final AuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleSignInAuthentication.accessToken,
  //       idToken: googleSignInAuthentication.idToken,
  //     );
  //     final UserCredential authResult = await _auth.signInWithCredential(credential);
  //     final User? user = authResult.user;
  //     return user;
  //   } catch (e) {
  //     debugPrint(e.toString());
  //     return null;
  //   }
  // }

  // future for email create user with firebase
  Future<void> signUpWithEmail({required String email, required String password, required BuildContext context}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
      // return null; cause this future returns nothing
    }
  }
}