
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sample_app/core/utils/api_utils.dart';
import 'package:sample_app/data/models/home_book_model.dart';

class BookDetailsDatasource {
  final apiUtils = ApiUtils();

  Future<List<HomeBookModel>> fetchBooksByAuthor(String author) async {
    try {
      final response = await apiUtils.getApi(
          baseUrl: "www.googleapis.com",
          path: '/books/v1/volumes/',
          query: {
            'key': dotenv.env['GOOGLE_BOOK_API_KEY']!,
            'q': 'author:$author',
            'maxResult': '10',
          });
      List<dynamic> data = response['items'];
      List<HomeBookModel> booksByAuthor = data
          .map(
            (homeBook) => HomeBookModel.fromJson(homeBook),
          )
          .toList();
      return booksByAuthor;
    } catch (e) {
      throw Exception("Error Occured While Fetching Books By Author : $e");
    }
  }

  Future<List<HomeBookModel>> fetchSimilarBooks(String category) async {
    try {
      final response = await apiUtils.getApi(
          baseUrl: "www.googleapis.com",
          path: '/books/v1/volumes/',
          query: {
            'key': dotenv.env['GOOGLE_BOOK_API_KEY']!,
            'q': 'subject:$category',
            'maxResult': '10',
          });
      List<dynamic> data = response['items'] ?? [];
      List<HomeBookModel> similarBooks = data
          .map(
            (homeBook) => HomeBookModel.fromJson(homeBook),
          )
          .toList();
      return similarBooks;
    } catch (e) {
      print("Error Occured While Fetching Similar Books : $e");
      throw Exception("Error Occured While Fetching Similar Books: $e");
    }
  }
  
}
