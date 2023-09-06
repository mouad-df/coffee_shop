import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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

              Text("Coffe is Life",
              style: TextStyle(
                fontSize: 19,
                color: Colors.white),),

              SizedBox(height:36,) ,
              // ignore: prefer_const_constructors
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25,vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  
                    borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Email",
                    hintStyle: TextStyle(color: Colors.white),
                    border: InputBorder.none),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                padding: EdgeInsets.symmetric(horizontal: 25,vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.grey[500],
                  
                    borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.white),
                    border: InputBorder.none),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: Text("Forgot Password?"),
              ),
              SizedBox(height: 20,),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 25,vertical: 25),
                decoration: BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Text("Sign In",
                style: TextStyle(color: Colors.white),),
              ),
              SizedBox(height: 14,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Divider(),
                  Text("Or Continue with"),
                  Divider(),
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