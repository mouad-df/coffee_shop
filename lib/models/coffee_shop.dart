import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minllogin_ui/models/coffee.dart';

class CoffeeShop extends GetxController {
  //Coffee list
  final List<Coffee> _shop = [
    Coffee(name: 'Long Balack', price: '4.10', imagePath: 'images/coffee.png'),
    Coffee(
        name: 'Latte', price: '4.20', imagePath: 'images/warm-black-mug.png'),
    Coffee(name: 'Espresso', price: '3.50', imagePath: 'images/coffee.png'),
    Coffee(name: 'Iced Coffee', price: '4.40', imagePath: 'images/coffee.png')
  ];
  //user cart
  List<Coffee> _userCart = [];

  //get coffee list

  List<Coffee> get coffeShop => _shop;

  //get user cart
  List<Coffee> get userCart => _userCart;

  //add item to cart
  void addItemToChart(Coffee coffee) {
    _userCart.add(coffee);
    update();
  }

  //removeItemFromCart
  void removeItemFromCart(Coffee coffee) {
    _userCart.remove(coffee);
    update();
  }
}
