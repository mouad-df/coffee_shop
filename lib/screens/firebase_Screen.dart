import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minllogin_ui/screens/cart_Screen.dart';
import 'package:minllogin_ui/screens/category_screen.dart';

class FirestoreSreeen extends StatelessWidget {
  const FirestoreSreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        child: Icon(Icons.add),
        onPressed: () {
          Get.to(() => CategoryScreen());
        },
      ),
      
      appBar: AppBar(
        title: Text("Firestore Screen"),
        actions: [
          Icon(Icons.exit_to_app),
        ],
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisExtent: 160),
        children: [
          Card(
            child: Column(children: [
              Container(
                  padding: EdgeInsets.all(15),
                  child: Image.asset('images/coffee.png',height: 50,width: 50,)),
              Text("Company")
            ]),
          ),
          Card(
            child: Column(children: [
              Container(
                  padding: EdgeInsets.all(15),
                  child: Image.asset('images/coffee.png',height: 50,width: 50,)),
              Text("Home")
            ]),
          )
        ],
      ),
    );
  }
}
