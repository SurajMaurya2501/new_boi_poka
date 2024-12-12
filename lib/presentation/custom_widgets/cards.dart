import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final double width;
  final double height;
  final EdgeInsetsGeometry padding;
  final Color color;

  const CustomCard({
    super.key,
    this.width = 120.0,
    this.height = 120.0,
    this.padding = const EdgeInsets.all(20.0),
    this.color = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade300, 
      child: SizedBox(
        width: width,
        height: height,
        child: Padding(
          padding: padding,
          child: Container(), 
        ),
      ),
    );
  }
}
