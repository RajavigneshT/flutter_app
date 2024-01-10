// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;

  CustomTextField({required this.controller, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 250,
        margin: EdgeInsets.only(bottom: 10),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
              labelText: labelText,
              isDense: true,
              filled: true,
              fillColor: Colors.white),
        ),
      ),
    );
  }
}
