import 'package:flutter/material.dart';

class CustomImageText extends StatelessWidget {
  final Function() onTap;
  final String img;
  final TextEditingController? controller;
  final String text;
  const CustomImageText({
    this.controller,
    required this.img,
    required this.onTap,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Image.asset(
              img,
              height: 70,
            ),
            const SizedBox(height: 5),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.5),
            ),
          ],
        ),
      ),
    );
  }
}
