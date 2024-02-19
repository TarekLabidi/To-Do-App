import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:to_do_list_app/utils/utils.dart';

class AuthMethods {
  //creating firebaseAuth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //state presistence
  Stream<User?> get authState => _auth.authStateChanges();

  //email sign up
  Future<void> signUpWithEmail(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      // Create user with email and password
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Send email verification
      await sendEmailVerification(context);
    } on FirebaseAuthException catch (e) {
      // Hide loading indicator

      // Handle specific errors
      switch (e.code) {
        case 'weak-password':
          showSnackBar(context, 'The password provided is too weak.');
          break;
        case 'email-already-in-use':
          showSnackBar(context, 'The email address is already in use.');
          break;
        default:
          showSnackBar(context, 'An error occurred: ${e.message}');
          break;
      }
    }
  }

//email login
  Future<void> loginWithEmailAndPassword(
    BuildContext context,
    String email,
    String password,
  ) async {
    try {
      print("okkkkk");
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (!_auth.currentUser!.emailVerified) {}
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  //email verification
  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      _auth.currentUser!.sendEmailVerification();
      showSnackBar(context, 'We Have sent you an email verification!');
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  //google sign in
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      //i remove the idToken because for some reason it always comes back as null coudnt fix taht :c
      if (googleAuth?.accessToken != null
          //&& googleAuth?.idToken != null
          ) {
        //Create a new crendential

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          //idToken:googleAuth?.idToken,
        );
        await _auth.signInWithCredential(credential);
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }
}
