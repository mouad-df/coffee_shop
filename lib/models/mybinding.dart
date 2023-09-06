import 'package:get/get.dart';
import 'package:minllogin_ui/models/coffee_shop.dart';

class MyBiinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CoffeeShop());
  }
}
