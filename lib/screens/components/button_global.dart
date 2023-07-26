// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class ButtonGlobal extends StatelessWidget {
  final Function()? onTap;
  final String text;

  const ButtonGlobal({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          alignment: Alignment.center,
          height: 70.0,
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(66, 56, 46, 1),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }
}
