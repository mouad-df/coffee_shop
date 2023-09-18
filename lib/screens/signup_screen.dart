import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minllogin_ui/screens/homeScreen.dart';
import 'package:minllogin_ui/screens/login_screen.dart';
import 'package:minllogin_ui/widgets/signin_options.dart';
import 'package:minllogin_ui/widgets/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  final auth = FirebaseAuth.instance;

  void passwordDontMatch(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          // ignore: prefer_const_constructors
          return AlertDialog(
            backgroundColor: Colors.blue,
            title: const Center(child: Text('Password dont match')),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.brown[100],
        body: Padding(
          padding: EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            child: Form(
              child: Column(children: [
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  "images/coffee.png",
                  height: 90,
                ),
                const SizedBox(
                  height: 15,
                ),

                const Text(
                  "Let's create an account for you!",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),

                const SizedBox(
                  height: 10,
                ),

                //ignore: prefer_const_constructors
                MyTextField(
                  hintText: "Email",
                  obscureText: false,
                  controller: emailController,
                  labelText: 'Email',
                  validator: (val) {},
                ),

                MyTextField(
                  hintText: "Password",
                  obscureText: true,
                  controller: passwordController,
                  labelText: 'Password',
                  validator: (val) {},
                ),
                MyTextField(
                  hintText: "Confirm Password",
                  obscureText: true,
                  controller: confirmpasswordController,
                  labelText: 'Confirm Password',
                  validator: (val) {},
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
                  height: 15,
                ),


              //user register before email verification
                InkWell(
                  onTap: () async {
                    try {
                      if (passwordController.text ==
                          confirmpasswordController.text) {
                        var user = await auth.createUserWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text);
                        FirebaseAuth.instance.currentUser!
                            .sendEmailVerification();

                        Get.off(LoginScreen());
                      } else {
                        passwordDontMatch(context);
                      }
                    } catch (e) {
                      print(e);
                    }
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
                      "Sign Up",
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
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
                SquareTile(
                    // ignore: prefer_const_constructors
                    icon: Text(
                  "Sign up with Google",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                )),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 7,
                ),
                // ignore: prefer_const_constructors
                SquareTile(
                    // ignore: prefer_const_constructors
                    icon: Text(
                  "Sign up with Facbook",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                )),
                const SizedBox(
                  height: 10,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    InkWell(
                      onTap: () => Get.off(LoginScreen()),
                      child: const Text(
                        "Login Now",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                    )
                  ],
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
