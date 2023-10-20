import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/screens/auth/login.dart';

CreateAccount(String username, String email, String password, context) async {
  try {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    await credential.user!.updateDisplayName(username);

    FirebaseAuth.instance.currentUser!.sendEmailVerification();
    Get.offAllNamed(Login.routeName);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                "Warning!",
                style: TextStyle(color: Colors.red),
              ),
              content: Text(
                "The password provided is too weak.",
                style: TextStyle(color: Colors.black),
              ),
            );
          });
    } else if (e.code == 'email-already-in-use') {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                "Warning!",
                style: TextStyle(color: Colors.red),
              ),
              content: Text(
                "The email address is already in use by another account.",
                style: TextStyle(color: Colors.black),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Ok",
                      style: TextStyle(color: Colors.black),
                    ))
              ],
            );
          });
    }
  } catch (e) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "error!",
              style: TextStyle(color: Colors.red),
            ),
            content: Text(
              "$e",
              style: TextStyle(color: Colors.black),
            ),
          );
        });
  }
}
