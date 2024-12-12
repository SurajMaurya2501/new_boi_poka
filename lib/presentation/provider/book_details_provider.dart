import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_app/controller/book_details_contoller.dart';
import 'package:sample_app/controller/shelf_controller.dart';
import 'package:sample_app/data/models/home_book_model.dart';

final getSelectedBooksDetailsProvider = FutureProvider<Map<String, dynamic>>(
  (ref) async {
    final shelfController = ShelfController();
    final response = await shelfController.checkIsbnLocally(
        ref.read(isbnProvider.notifier).state,
        ref.read(titleProvider.notifier).state,
        ref.read(authorsProvider.notifier).state);
    // ref.watch(showLoadingProvider.notifier).state = false;
    return response;
  },
);

final booksByAuthorProvider =
    FutureProvider.family<List<HomeBookModel>, String>(
  (ref, arg) {
    return BookDetailsContoller().getBooksByAuthor(arg);
  },
);

final similarBooksProvider = FutureProvider.family<List<HomeBookModel>, String>(
  (ref, arg) {
    return BookDetailsContoller().getSimilarBooks(arg);
  },
);

final isbnProvider = StateProvider<String>((ref) => '');
final authorsProvider = StateProvider<List<String>>((ref) => []);
final titleProvider = StateProvider<String>((ref) => '');
