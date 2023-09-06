import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CoffeeScreen extends StatelessWidget {
  const CoffeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Coffe Screen"),
      ),
      body: Center(
          child: MaterialButton(
        child: Text("go back"),
        color: Colors.red,
        textColor: Colors.white,
        onPressed: () {
          Get.back();
        },
      )),
    );
  }
}
