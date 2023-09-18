import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minllogin_ui/models/mybinding.dart';
import 'package:minllogin_ui/screens/firebase_Screen.dart';
import 'package:minllogin_ui/screens/homeScreen.dart';
import 'package:minllogin_ui/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:(FirebaseAuth.instance.currentUser != null && FirebaseAuth.instance.currentUser!.emailVerified)? LoginScreen():HomeScreen(),
      
      initialBinding: MyBiinding(),
      getPages: [
        GetPage(name: "/", page: () => const FirestoreSreeen()),
      ],
    );
  }
}
