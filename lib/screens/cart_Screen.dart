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
      
      builder: (controller) => SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            const Text(
              "Your Cart",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 25,),
            Expanded(
                child: ListView.builder(
                    itemCount: controller.userCart.length,
                    itemBuilder: (context, index) {
                      Coffee eachCoffee = controller.userCart[index];
                      return CoffeTile(
                          coffee: eachCoffee,
                          onPressed: () => removeFromCart(eachCoffee),
                          icon: const Icon(Icons.delete));
                    })),
                    GestureDetector(
                      
                      child: Container(
                        padding: const EdgeInsets.all(25),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.brown,
                        ),
                        child: const Center(
                          child: Text(
                            "Pay Now",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white),),
                        ),
                      ),
                    )
          ],
        ),
      )),
    );
  }
}
