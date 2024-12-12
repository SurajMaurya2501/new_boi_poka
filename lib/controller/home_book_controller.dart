import 'package:sample_app/core/constants/home_book_list.dart';
import 'package:sample_app/data/models/home_book_model.dart';

class HomeBookController {
  final homeData = HomebookData();

  Future<List<HomeBookModel>> getHomeBooksData() async {
    List<HomeBookModel> data = homeData.homeBookList.map(
      (book) {
        return HomeBookModel.fromJson(book);
      },
    ).toList();
    return data;
  }
  
}
