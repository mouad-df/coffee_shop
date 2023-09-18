// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minllogin_ui/controllers/login_controller.dart';
import 'package:minllogin_ui/screens/homeScreen.dart';
import 'package:minllogin_ui/screens/signup_screen.dart';
import 'package:minllogin_ui/widgets/signin_options.dart';
import 'package:minllogin_ui/widgets/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  LoginInController controller = Get.put(LoginInController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.brown[100],
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            child: Form(
              key: controller.formState,
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Image.asset(
                    "images/coffee.png",
                    height: 140,
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  const Text(
                    "Coffee is Life",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.white),
                  ),

                  const SizedBox(
                    height: 15,
                  ),
                  // ignore: prefer_const_constructors
                  MyTextField(
                      hintText: "Email",
                      obscureText: false,
                      controller: controller.emailController,
                      labelText: 'Email',
                      validator: (val) {
                        if (val == "") {
                          return "Can't be Empty";
                        }
                        ;
                      }),

                  MyTextField(
                      hintText: "Password",
                      obscureText: true,
                      controller: controller.passwordController,
                      labelText: 'Password',
                      validator: (val) {
                        if (val == "") {
                          return "Can't be Empty";
                        }
                        ;
                      }),

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
                    onTap: () {
                      controller.sigIn();
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
                          child:
                              Divider(thickness: 1, color: Colors.grey[800])),
                    ],
                  ),
                  const SizedBox(
                    height: 14,
                  ),

                  // ignore: prefer_const_constructors
                  SquareTile(
                      // ignore: prefer_const_constructors
                      icon: Text(
                    "Login with Google",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )),
                  // ignore: prefer_const_constructors
                  SizedBox(
                    height: 10,
                  ),
                  // ignore: prefer_const_constructors
                  SquareTile(
                      // ignore: prefer_const_constructors
                      icon: Text(
                    "Login with Facebook",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  )),
                  const SizedBox(
                    height: 10,
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
                        onTap: () => Get.off(SignUpScreen()),
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
      ),
    );
  }
}
