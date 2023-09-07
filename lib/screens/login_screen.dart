// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minllogin_ui/screens/signup_screen.dart';
import 'package:minllogin_ui/widgets/signin_options.dart';
import 'package:minllogin_ui/widgets/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final auth = FirebaseAuth.instance;

  void wrongEmailMessage() {
    showDialog(
        context: context,
        builder: (context) {
          // ignore: prefer_const_constructors
          return AlertDialog(
            backgroundColor: Colors.blue,
            title: const Center(child: Text('Wrong Email')),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.brown[100],
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  "images/coffee.png",
                  height: 150,
                ),
                const SizedBox(
                  height: 30,
                ),

                const Text(
                  "Coffee is Life",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.white),
                ),

                const SizedBox(
                  height: 20,
                ),
                // ignore: prefer_const_constructors
                MyTextField(
                  hintText: "Email",
                  obscureText: false,
                  controller: emailController,
                ),

                MyTextField(
                  hintText: "Password",
                  obscureText: true,
                  controller: passwordController,
                ),

                InkWell(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.centerRight,
                    // ignore: prefer_const_constructors
                    child: Text(
                      "Forgot Password?",
                      // ignore: prefer_const_constructors
                      style: TextStyle(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () async {
                    await showDialog(
                        context: context,
                        builder: (context) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        });
                    try {
                      var user = await auth.signInWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text);
                      // if (user != null) {
                      //   Get.to(HomeScreen());
                      // }
                      Get.back();
                    } on FirebaseAuthException catch (e) {
                      print(e.code);
                      Get.back();
                      if (e.code == 'user-not-found') {
                        wrongEmailMessage();
                      }
                    }

                    Get.back();
                    
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 19),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15)),
                    // ignore: prefer_const_constructors
                    child: Text(
                      "Sign In",
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                  ),
                ),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Divider(
                      thickness: 1,
                      color: Colors.grey[800],
                    )),
                    // ignore: prefer_const_constructors
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: const Text("Or Continue with"),
                    ),
                    Expanded(
                        child: Divider(thickness: 1, color: Colors.grey[800])),
                  ],
                ),
                const SizedBox(
                  height: 14,
                ),

                // ignore: prefer_const_constructors
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // ignore: prefer_const_constructors
                    SquareTile(
                      // ignore: prefer_const_constructors
                      icon: Icon(
                        Icons.facebook,
                        color: Colors.black,
                        size: 50,
                      ),
                    ),
                    // ignore: prefer_const_constructors
                    SizedBox(
                      width: 25,
                    ),
                    // ignore: prefer_const_constructors
                    SquareTile(
                        // ignore: prefer_const_constructors
                        icon: Icon(
                      Icons.android,
                      color: Colors.black,
                      size: 50,
                    ))
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Not a memeber?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    InkWell(
                      onTap: () => Get.to(SignUpScreen()),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
