// ignore_for_file: must_be_immutable, unnecessary_import, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:minllogin_ui/models/category_controller.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  CategoryController controller = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CategoryScreen"),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: TextFormField(
            autofocus: true,
            controller: controller.name,
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 18, horizontal: 25),
                filled: true,
                fillColor: Colors.grey[200],
                hintText: "Enter your name",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            MaterialButton(
              color: Colors.orange,
              textColor: Colors.white,
              hoverColor: Colors.black,
              child: Text("Add"),
              onPressed: () {
                controller.addUser();

                controller.name.text = "";
              },
            ),
            MaterialButton(
              color: Colors.orange,
              textColor: Colors.white,
              hoverColor: Colors.black,
              child: Text("fetch all documents"),
              onPressed: () async {
                controller.fetchData();
              },
            )
          ]),
        ),
        StreamBuilder(
          stream: controller.userStream,
          builder: (context, snapshot){
            if (snapshot.hasError) {
              return Text("Error");
            }
            
            return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                          title: Text("${snapshot.data!.docs[index]["name"]}")),
                    );
                  });
            
          },
        )
      ]),
    );
  }
}
