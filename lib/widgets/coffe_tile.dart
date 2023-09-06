import 'package:flutter/material.dart';
import 'package:minllogin_ui/models/coffee.dart';

class CoffeTile extends StatelessWidget {
  const CoffeTile({super.key, required this.coffee, required this.onPressed, required this.icon});
  final Coffee coffee;
  final void Function()? onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[200],
      ),
      child: ListTile(
        title: Text(coffee.name),
        leading: Image.asset(coffee.imagePath),
        trailing: IconButton(
          icon: icon,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
