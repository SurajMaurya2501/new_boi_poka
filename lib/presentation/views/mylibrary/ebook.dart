import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sample_app/data/models/home_book_model.dart';
import 'package:sample_app/presentation/views/book_details/widgets/bookcard.dart';

class Ebook extends StatefulWidget {
  const Ebook({super.key});

  @override
  State<Ebook> createState() => _EbookState();
}

class _EbookState extends State<Ebook> {
  @override
  void initState() {
    super.initState();
    fetchBooks();
  }

  List<HomeBookModel> books = [];
  Future<void> fetchBooks() async {
    final response = await http.get(
        Uri.parse('https://www.googleapis.com/books/v1/volumes?q=author:ye'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        books =
            (data['items'] as List).map((item) => HomeBookModel.fromJson(item)).toList();
      });
    } else {
      throw Exception('Failed to load books');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Row(
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  'BOOKS BY THE AUTHOR',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: books.isEmpty
                  ? [const Center(child: CircularProgressIndicator())]
                  : books.map((book) {
                      return SizedBox(
                        // width: 200,
                        child: BookCard(book: book),
                      );
                    }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
