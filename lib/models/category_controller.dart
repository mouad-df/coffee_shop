import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  TextEditingController name = TextEditingController();

  CollectionReference category =
      FirebaseFirestore.instance.collection("categories");

  List? data = [];

  Future<void> addUser() async {
    if (name.text != "") {
      return category
          .add({
            "name": name.text,
          })
          .then((value) => print("user Added"))
          .catchError((error) => print("failed to Add user: $error"));
    } else {
      print("Enter a value");
    }
  }

  fetchData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("categories").get();
    data!.addAll(querySnapshot.docs);
    
  }
}
