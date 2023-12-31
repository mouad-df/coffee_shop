// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minllogin_ui/screens/homeScreen.dart';
import 'package:minllogin_ui/screens/login_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginInController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  void myDialog(String? title, String? middText) {
    Get.defaultDialog(
      title: title!,
      middleText: middText!,
      titleStyle: TextStyle(color: Colors.red, fontSize: 20),
      textCancel: "Ok",
    );
  }

  final auth = FirebaseAuth.instance;

  void sigIn() async {
    if (formState.currentState!.validate()) {
      try {
        var user = await auth.signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
        if (user.user!.emailVerified) {
          // Get.back();
          Get.off(() => HomeScreen());
        } else {
          myDialog("Verify your account", "check your email inbox");
        }
      } on FirebaseAuthException catch (e) {
        print(e.code);

        if (e.code == 'user-not-found' || e.code == 'invalid-email') {
          // wrongEmailMessage();
          myDialog("User not found", "Please Sign up");
        }
        if (e.code == 'wrong-password') {
          // wrongPassMessage();
          myDialog("Wrong password", "Please try again");
        }
        if (emailController.text == "" || passwordController.text == "") {
          myDialog("Error", "Enter required Field");
        }
        if (emailController.text == "" && passwordController.text == "") {
          myDialog("Error", "Enter required Fields");
        }
      }
    } else {
      print("Not valid");
    }
  }

  Future signINWithGoogle() async {
    //triger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    //Obtain a new Credential
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    //Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    FirebaseAuth.instance.signInWithCredential(credential);
    Get.off(HomeScreen());
  }

  @override
  void onInit() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print("User is currently signed out");
      } else {
        print("User is signed in");
      }
    });
    super.onInit();
  }
}
