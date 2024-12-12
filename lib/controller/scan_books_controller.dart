import 'package:sample_app/data/datasources/scan_books_datasource.dart';

class ScanBooksController {
  final scanBookDatasource = ScanBooksDatasource();

  Future<Map<String, dynamic>?> getBookDetails(String isbn) async {
    return scanBookDatasource.fetchBookDetails(isbn);
  }
  
}
