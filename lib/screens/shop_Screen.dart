import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minllogin_ui/models/coffee.dart';
import 'package:minllogin_ui/models/coffee_shop.dart';
import 'package:minllogin_ui/widgets/coffe_tile.dart';

// ignore: must_be_immutable
class ShopScreen extends StatelessWidget {
  ShopScreen({super.key});

  // final controlle = Get.lazyPut(
  //   () => CoffeeShop(),
  // );

  CoffeeShop controller = Get.find();

  void addCart(
    Coffee coffee,
  ) {
    controller.addItemToChart(coffee);
    controller.increment();

    Get.snackbar("product added", "you have added ${coffee.name} to the cart",
        snackPosition: SnackPosition.TOP, duration: Duration(seconds: 2));
  }

  // final CoffeeShop controller = Get.put(CoffeeShop());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CoffeeShop>(
      builder: (controller) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Text(
                "How would you like your coffee ${controller.counter} ",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 25,
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: controller.coffeShop.length,
                itemBuilder: (context, index) {
                  Coffee eachCoffee = controller.coffeShop[index];

                  return CoffeTile(
                    coffee: eachCoffee,
                    onPressed: () => addCart(eachCoffee),
                    icon: const Icon(Icons.add),
                  );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
