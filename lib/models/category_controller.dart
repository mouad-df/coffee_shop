import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
            // 'id': FirebaseAuth.instance.currentUser!.uid,
            "name": name.text,
          })
          .then((value) => print("user Added $value"))
          .catchError((error) => print("failed to Add user: $error"));
    } else {
      print("Enter a value");
    }
  }

  fetchData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("categories").get();
    data!.addAll(querySnapshot.docs);
    print(data![0].id);
  }

  deleteData() async {
    await FirebaseFirestore.instance
        .collection('categories')
        .doc(data![0].id)
        .delete()
        .then((value) => print("document deleted"))
        .catchError((error) => print("failed deleting document"));
  }
}
