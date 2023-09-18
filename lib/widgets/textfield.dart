// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final String hintText;
  final bool obscureText;
  final String labelText;
  final String? Function(String?)? validator;
  const MyTextField({
    super.key,
    this.controller,
    required this.hintText,
    required this.obscureText, required this.labelText,required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      // padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
      decoration: BoxDecoration(
        // color: Colors.black,
        borderRadius: BorderRadius.circular(12),
      ),
      // ignore: prefer_const_constructors
      child: TextFormField(
        validator: validator,
        autofocus: true,
        controller: controller,
        decoration: InputDecoration(
            labelText: labelText,
            focusColor: Colors.black,
            // contentPadding: EdgeInsets.symmetric(horizontal: 15,),
            fillColor: Colors.orange[50],
            filled: true,
            hintText: hintText,
            hintStyle:
                // ignore: prefer_const_constructors
                TextStyle(fontWeight: FontWeight.w300, color: Colors.black),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(15)),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            )),
        obscureText: obscureText,
      ),
    );
  }
}
