 import 'package:flutter/material.dart';

Widget buildDot(int index,int selectedIndex, BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: 10,
      height: 5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: selectedIndex == index
            ? Colors.black
            : const Color.fromARGB(255, 183, 181, 181),
      ),
    );
  }