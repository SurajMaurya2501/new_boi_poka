import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_app/presentation/provider/book_details_provider.dart';
import 'package:sample_app/presentation/views/book_details/widgets/bookcard.dart';

class SimilarBooks extends ConsumerWidget {
  final String category;
  const SimilarBooks({required this.category, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final similarBooks = ref.watch(similarBooksProvider(category));

    return similarBooks.when(
      data: (data) {
        return SizedBox(
            height: 220,
            child: data.isNotEmpty
                ? ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return BookCard(book: data[index]);
                    })
                : Center(
                    child: Text("No Books Found"),
                  ));
      },
      error: (error, stackTrace) {
        throw Exception(
            "Error Occured While Provider Similar Books Fetching:$error");
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
