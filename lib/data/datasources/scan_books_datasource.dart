import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sample_app/core/utils/api_utils.dart';
import 'package:sample_app/data/models/home_book_model.dart';

class ScanBooksDatasource {
  Future<Map<String, dynamic>?> fetchBookDetails(String isbn) async {
    final apiUtils = ApiUtils();
    try {
      final response = await apiUtils.getApi(
          baseUrl: "www.googleapis.com",
          path: "/books/v1/volumes/",
          query: {
            "key": dotenv.env['GOOGLE_BOOK_API_KEY']!,
            "q": "isbn:$isbn"
          });

      List<dynamic> temp = response['items'] ?? [];

      if (temp.isNotEmpty) {
        List<HomeBookModel> data = temp
            .map(
              (book) => HomeBookModel.fromJson(book),
            )
            .toList();

        final bookData = data[0].volumeInfo;
        return {
          'title': bookData.title,
          'authors': bookData.authors,
          'description': bookData.description,
          'thumbnail': bookData.imageLinks.thumbnail,
          "categories": bookData.categories
        };
      }
    } catch (e) {
      throw Exception("Error Occured while scanning book : $e");
    }
    return null;
  }
}
