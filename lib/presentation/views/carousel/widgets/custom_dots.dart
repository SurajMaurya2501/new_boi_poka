  import "package:flutter/material.dart";

Widget buildDot(int index, BuildContext context,int selectedIndex) => Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: 10,
      height: 5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: selectedIndex == index ? Colors.white : Colors.grey,
      ),
    );