import 'package:flutter/material.dart';

class NoImageWidget extends StatelessWidget {
  final double height;
  final double width;
  final Offset boxShadowOffSet;
  final double? blurRadius;
  const NoImageWidget(
      {required this.blurRadius,
      required this.boxShadowOffSet,
      required this.height,
      required this.width,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(
        10.0,
      ),
      alignment: Alignment.center,
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(
            3.0,
          ),
          boxShadow: [
            BoxShadow(
                blurRadius: blurRadius ?? 0,
                color: Colors.grey,
                offset: boxShadowOffSet)
          ]),
      child: Text(
        "No\nImage",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
