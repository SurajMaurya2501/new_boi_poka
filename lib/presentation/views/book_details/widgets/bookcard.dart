import 'package:flutter/material.dart';
import 'package:sample_app/data/models/home_book_model.dart';
import 'package:sample_app/presentation/views/book_details/widgets/no_image_widget.dart';

class BookCard extends StatelessWidget {
  final HomeBookModel book;

  const BookCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        book.volumeInfo.imageLinks.thumbnail.isNotEmpty
            ? Container(
                margin: EdgeInsets.all(
                  10.0,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      3.0,
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(6, 6),
                        color: Colors.grey,
                      )
                    ]),
                child: Image.network(
                  book.volumeInfo.imageLinks.thumbnail,
                  height: 150,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              )
            : NoImageWidget(
                blurRadius: 0.0,
                boxShadowOffSet: Offset(6, 6),
                height: 150,
                width: 100,
              ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: SizedBox(
            width: 100,
            child: Text(
              book.volumeInfo.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
