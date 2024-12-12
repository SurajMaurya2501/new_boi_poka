import 'package:flutter/material.dart';

class CustomIsbnInputBox extends StatelessWidget {
  final TextEditingController isbnController;
  const CustomIsbnInputBox({required this.isbnController, super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Enter ISBN'),
      content: TextField(
        controller: isbnController,
        decoration: const InputDecoration(hintText: 'ISBN Code'),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: const Text('OK'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
