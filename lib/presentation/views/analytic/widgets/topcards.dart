import 'package:flutter/material.dart';

class Topcards extends StatelessWidget {
  final String title;
  final String value;

  const Topcards({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      width: 95,
      child: Card(
        color: Colors.grey.shade200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 10),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  value,
                  style: const TextStyle(fontSize: 30),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
