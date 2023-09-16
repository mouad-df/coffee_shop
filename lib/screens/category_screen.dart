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
        MaterialButton(
          color: Colors.orange,
          textColor: Colors.white,
          hoverColor: Colors.black,
          child: Text("Add"),
          onPressed: () {
            controller.addUser();
            controller.fetchData();
            controller.name.text = "";
          },
        )
      ]),
    );
  }
}
