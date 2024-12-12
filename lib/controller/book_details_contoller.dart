import 'package:sample_app/data/datasources/book_details_datasource.dart';
import 'package:sample_app/data/models/home_book_model.dart';

class BookDetailsContoller {
  final bookDetailsDataSource = BookDetailsDatasource();

  Future<List<HomeBookModel>> getBooksByAuthor(String author) async {
    return await bookDetailsDataSource.fetchBooksByAuthor(author);
  }

  Future<List<HomeBookModel>> getSimilarBooks(String category) async {
    return await bookDetailsDataSource.fetchSimilarBooks(category);
  }
  
}
