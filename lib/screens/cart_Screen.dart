import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minllogin_ui/models/coffee.dart';
import 'package:minllogin_ui/models/coffee_shop.dart';
import 'package:minllogin_ui/widgets/coffe_tile.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

CoffeeShop controller = Get.find();

void removeFromCart(Coffee coffee) {
  controller.removeItemFromCart(coffee);
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CoffeeShop>(
      init: CoffeeShop(),
      builder: (controller) => SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Text(
              "Your Cart",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 25,),
            Expanded(
                child: ListView.builder(
                    itemCount: controller.userCart.length,
                    itemBuilder: (context, index) {
                      Coffee eachCoffee = controller.userCart[index];
                      return CoffeTile(
                          coffee: eachCoffee,
                          onPressed: () => removeFromCart(eachCoffee),
                          icon: Icon(Icons.delete));
                    }))
          ],
        ),
      )),
    );
  }
}
