// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';

class ElevatedButtonCustom extends StatelessWidget {
  String buttonText;
  var onPressed;
  Color? backgroundColor;

  ElevatedButtonCustom(
      {Key? key,
      required this.buttonText,
      required this.onPressed,
      this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(backgroundColor),
          ),
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: const TextStyle(color: Colors.black87),
          ),
        ));
  }
}
