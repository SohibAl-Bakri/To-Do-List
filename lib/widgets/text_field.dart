// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  TextEditingController controller;
  var onChange;
  String hint;
  String label;
  bool hide;
  var keyboardType;
  TextFieldCustom(
      {Key? key,
      required this.keyboardType,
      required this.hide,
      required this.controller,
      this.onChange,
      required this.hint,
      required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: TextField(
        controller: controller,
        onChanged: onChange,
        keyboardType: keyboardType,
        obscureText: hide,
        decoration: InputDecoration(
          hintText: hint,
          label: Text(label),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
