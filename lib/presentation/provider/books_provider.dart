import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_app/controller/home_book_controller.dart';

final bookListProvider = FutureProvider(
  (ref) {
    return HomeBookController().getHomeBooksData();
  },
);

final viewToggleProvier = StateProvider<bool>(
  (ref) => true,
);
