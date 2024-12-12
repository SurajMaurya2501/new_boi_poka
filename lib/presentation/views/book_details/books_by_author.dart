import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_app/presentation/provider/book_details_provider.dart';
import 'package:sample_app/presentation/views/book_details/widgets/bookcard.dart';

class BooksByAuthor extends ConsumerWidget {
  final String authorName;
  const BooksByAuthor({required this.authorName, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final booksByAuthor = ref.watch(booksByAuthorProvider(authorName));

    return booksByAuthor.when(
      data: (data) {
        return SizedBox(
          height: 220,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: data.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return BookCard(book: data[index]);
              }),
        );
      },
      error: (error, stackTrace) {
        throw Exception("Error Occured While Provider Fetching:$error");
      },
      loading: () {
        return SizedBox(
          height: 220,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: 150,
                  width: 100,
                );
              }),
        );
      },
    );
  }
}
