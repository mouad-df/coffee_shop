import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// ignore: must_be_immutable
class BottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;

  BottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      // ignore: prefer_const_constructors
      margin: EdgeInsets.all(25),
      child: GNav(
        onTabChange: (value) => onTabChange!(value),
        color: Colors.grey[500],
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        activeColor: Colors.grey[800],
        // ignore: prefer_const_constructors
        padding: EdgeInsets.all(14),
        tabBackgroundColor: Colors.grey.shade400,
        tabBorderRadius: 24,
        tabActiveBorder: Border.all(color: Colors.white),
        // ignore: prefer_const_literals_to_create_immutables
        tabs: [
          // ignore: prefer_const_constructors
          GButton(
            icon: Icons.home,
            text: 'Shop',
          ),
          // ignore: prefer_const_constructors
          GButton(
            icon: Icons.shopping_bag_outlined,
            text: 'Cart',
          )
        ],
      ),
    );
  }
}
