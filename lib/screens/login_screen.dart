import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minllogin_ui/screens/homeScreen.dart';
import 'package:minllogin_ui/widgets/textfield.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.brown[200],
        body:Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            child: Column(
            children: [
              SizedBox(height: 30,),
              Image.asset("images/coffee.png",
              height: 150,),
              SizedBox(height: 30,),

              Text(
                "Coffee is Life",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.white),),

              const SizedBox(height:36,) ,
              // ignore: prefer_const_constructors
              MyTextField(hintText: "Email", 
              obscureText: false,
              controller:usernameController ,),

              MyTextField(
                hintText: "Password", 
                obscureText: true,
                controller:passwordController ,),

              Container(
                alignment: Alignment.centerRight,
                // ignore: prefer_const_constructors
                child: Text("Forgot Password?",
                // ignore: prefer_const_constructors
                style: TextStyle(
                ),),
              ),
              const SizedBox(height: 20,),
              InkWell(
                onTap:()=> Get.to(HomeScreen()),
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 25,vertical: 19),
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Text(
                    "Sign In",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white),),
                ),
              ),
              SizedBox(height: 14,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Divider(thickness: 1,color: Colors.grey[800],)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text("Or Continue with"),
                  ),
                  Expanded(child: Divider(thickness: 1,color: Colors.grey[800])),
                ],
              ),
              SizedBox(height: 14,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  Container(
                    padding: EdgeInsets.all(12),
                    child: Icon(Icons.facebook,
                    color: Colors.black,
                    size: 50,),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(12),

                    ),
                  ),
                  SizedBox(width: 25,),
                  Container(
                    padding: EdgeInsets.all(12),
                    child: Icon(Icons.android,
                    color: Colors.grey,
                    size: 50,),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(12),

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