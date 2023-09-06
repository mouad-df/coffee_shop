import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:minllogin_ui/models/coffee_shop.dart';
import 'package:minllogin_ui/screens/coffe_screen.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  final CoffeeShop controller = Get.put(CoffeeShop());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Text(
              "How would you like your coffee",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 25,
            ),
            GetBuilder<CoffeeShop>(
                init: CoffeeShop(),
                builder: (controller) {
                  print("rebuild");
                  return Column(children: [
                    MaterialButton(
                        child: Text("increment"),
                        color: Colors.red,
                        textColor: Colors.white,
                        onPressed: () {
                          controller.increment();
                        }),
                    Text('${controller.counter}')
                  ]);
                }),
            Expanded(
                child: ListView.builder(
              itemBuilder: (context, index) {},
            ))
          ],
        ),
      ),
    );
  }
}
