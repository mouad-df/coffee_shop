import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:minllogin_ui/models/mybinding.dart';
import 'package:minllogin_ui/screens/homeScreen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      initialRoute: "/",
      initialBinding: MyBiinding(),
      // getPages: [
      //   GetPage(name: "/", page:()=> HomeScreen()),
      //   GetPage(name: "/page1", page: ()=> CoffeeScreen(),)
      // ],
    );
  }
}