import 'package:flutter/material.dart';

class BookWidget extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final String imageUrl;

  const BookWidget(
      {super.key,
      required this.width,
      required this.height,
      required this.color,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        // color: color,
        image: DecorationImage(
          image: NetworkImage(
            imageUrl,
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(4),
        boxShadow: const [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 5,
            offset: Offset(10, 10),
          ),
        ],
      ),
      alignment: Alignment.center,
    );
  }
}
