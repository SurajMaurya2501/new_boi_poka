import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_app/controller/home_book_controller.dart';
import 'package:sample_app/data/models/home_book_model.dart';
import 'package:sample_app/presentation/provider/book_shelf_riverpod.dart';
import 'package:sample_app/presentation/views/book_shelf.dart/widgets/book_widget.dart';
import 'package:sample_app/presentation/views/book_shelf.dart/widgets/shelf_row.dart';

List<String> imagesUrl = [
  "http://books.google.com/books/content?id=yHoHVDlB0qoC&printsec=frontcover&img=1&zoom=1&source=gbs_api",
  "http://books.google.com/books/content?id=TCtXEAAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api",
  "http://books.google.com/books/content?id=jEaTEAAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api",
  "http://books.google.com/books/content?id=V3lsKdY7X8MC&printsec=frontcover&img=1&zoom=1&source=gbs_api",
  "http://books.google.com/books/content?id=o_ea5_c4HxQC&printsec=frontcover&img=1&zoom=1&source=gbs_api",
  "http://books.google.com/books/content?id=9AuNEAAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api",
  "http://books.google.com/books/content?id=vGFR3sZmpmEC&printsec=frontcover&img=1&zoom=1&source=gbs_api",
  "http://books.google.com/books/content?id=Ze8OzQEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api",
  "http://books.google.com/books/content?id=0CFAjgEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api",
  "http://books.google.com/books/content?id=xfNMRAAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api",
  "http://books.google.com/books/content?id=Ak8VvgAACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api",
  "http://books.google.com/books/content?id=PjoADALqtaAC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
  "http://books.google.com/books/content?id=_J-6zwEACAAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api",
];

class BookShelf extends StatefulWidget {
  const BookShelf({super.key});

  @override
  State<BookShelf> createState() => _BookShelfState();
}

class _BookShelfState extends State<BookShelf> {
  final homeController = HomeBookController();
  List<HomeBookModel> allBookData = [];
  bool isLoading = true;
  List<int> rowsBooksLen = [];
  double rows = 0;

  @override
  void initState() {
    homeController.getHomeBooksData().then(
      (value) {
        allBookData = value;
        getRows(allBookData.length);
        listToMatrix(allBookData);
        isLoading = false;
        setState(() {});
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book Shelf"),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        centerTitle: true,
        backgroundColor: Colors.brown,
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              color: Colors.grey[300],
              child: Column(
                  children: [
                    //Selected Book Area

                    Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.brown, width: 15),
                        ),
                      ),
                    ),

                    //Book Shelf Page

                    ShelfRow(
                      rowsBooksLen: rowsBooksLen,
                    ),

                    const Spacer(),

                    Consumer(
                      builder: (context, ref, child) {
                        final isTriggered = ref.watch(triggerProvider);

                        return Visibility(
                          visible: false,
                          child: Container(
                            margin: const EdgeInsets.all(
                              10.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                BookWidget(
                                  width: 80,
                                  height: 130,
                                  color: Colors.green,
                                  imageUrl: imagesUrl[isTriggered],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      text: TextSpan(children: [
                                        const TextSpan(
                                          text: "Title: ",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(
                                          text: allBookData[isTriggered]
                                              .volumeInfo
                                              .title,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                          ),
                                        )
                                      ]),
                                    ),
                                    SizedBox(
                                      height: 80,
                                      width: MediaQuery.sizeOf(context).width *
                                          0.6,
                                      child: RichText(
                                        maxLines: 4,
                                        overflow: TextOverflow.ellipsis,
                                        text: TextSpan(children: [
                                          const TextSpan(
                                            text: "Description: ",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          TextSpan(
                                            text: allBookData[isTriggered]
                                                .volumeInfo
                                                .description,
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                            ),
                                          )
                                        ]),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 50,
                                      width: 100,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        child: const Text(
                                          "Read",
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ]),
            ),
    );
  }

  void listToMatrix(List<HomeBookModel> allBookData) {
    List<List<HomeBookModel>> bookDataInMatrix = [];
    int size = 10;
    for (int i = 0; i < allBookData.length; i += size) {
      if (allBookData.length >= i + size) {
        bookDataInMatrix.add(
          allBookData.sublist(
            i,
            i + size,
          ),
        );
      } else {
        bookDataInMatrix.add(
          allBookData.sublist(i),
        );
      }
    }
  }

  void getRows(int booksLen) {
    rows = (booksLen / 10).ceilToDouble();
    while (rows != 0) {
      if (booksLen - 10 >= 0) {
        rowsBooksLen.add(10);
        booksLen -= 10;
      } else {
        rowsBooksLen.add(booksLen);
      }
      rows = rows - 1;
    }
  }
}
