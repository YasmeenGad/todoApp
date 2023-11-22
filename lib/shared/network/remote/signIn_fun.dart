import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/layout/home_layout.dart';
import 'package:todo/shared/firebase/firebase_func.dart';
// signIn function

SignIn(String email, String password, context) async {
  try {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    if (credential.user!.emailVerified) {
      FirebaseFunctions.readUserFromFireStore(credential.user!.uid);
      Get.snackbar("Congrates!", "you have signned in successfully",
          backgroundColor: Colors.white);

      Get.offAllNamed(HomeLayout.routeName);
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                "Warning!",
                style: TextStyle(color: Colors.red),
              ),
              content: Text(
                "Please verify your email",
                style: TextStyle(color: Colors.black),
              ),
            );
          });
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                "Warning!",
                style: TextStyle(color: Colors.red),
              ),
              content: Text(
                "No user found for that email.",
                style: TextStyle(color: Colors.black),
              ),
            );
          });
    } else if (e.code == 'wrong-password') {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                "Warning!",
                style: TextStyle(color: Colors.red),
              ),
              content: Text(
                "Wrong password provided for that user.",
                style: TextStyle(color: Colors.black),
              ),
            );
          });
    }
  }
}
