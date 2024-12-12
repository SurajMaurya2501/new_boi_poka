import 'package:flutter/material.dart';

class ImageViewWidget extends StatelessWidget {
  final String bookThumbnail;
  const ImageViewWidget({required this.bookThumbnail,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          5.0,
        ),
        image: DecorationImage(
          image: NetworkImage(
            bookThumbnail,
          ),
          fit: BoxFit.cover,
        ),
        boxShadow: const [
          BoxShadow(
            blurRadius: 2,
            color: Colors.grey,
            offset: Offset(
              10.0,
              10.0,
            ),
          )
        ],
      ),
    );
  }
}
