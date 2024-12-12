import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_app/core/constants/app_routes.dart';
import 'package:sample_app/presentation/provider/books_provider.dart';
import 'package:sample_app/presentation/routes/app_router.gr.dart';

class PhysicalScreen extends ConsumerWidget {
  const PhysicalScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allBooksData = ref.watch(bookListProvider);
    final isListView = ref.watch(viewToggleProvier);
    Map<String, dynamic> bookDetails = {};

    return allBooksData.when(
      data: (data) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25.0,
                ),
                child: Row(
                  children: [
                    const Text(
                      "HOME LIB",
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        ref.read(viewToggleProvier.notifier).state =
                            !isListView;
                      },
                      icon: const Icon(
                        Icons.grid_on,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                      child: VerticalDivider(),
                    ),
                    IconButton(
                      onPressed: () {
                        ref.read(viewToggleProvier.notifier).state =
                            !isListView;
                      },
                      icon: const Icon(
                        Icons.list_alt,
                      ),
                    ),
                  ],
                ),
              ),
              isListView
                  ? Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: 8,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                                crossAxisSpacing: 15.0,
                                mainAxisSpacing: 15.0,
                                childAspectRatio: 0.68),
                        itemBuilder: (context, index) {
                          String imageUrl = data[index]
                                  .volumeInfo
                                  .imageLinks
                                  .thumbnail
                                  .isNotEmpty
                              ? data[index].volumeInfo.imageLinks.thumbnail
                              : "https://www.ingramspark.com/hs-fs/hubfs/TheSumofAllThings_cover_June21_option4(1).jpg?width=1125&name=TheSumofAllThings_cover_June21_option4(1).jpg";
                          return GestureDetector(
                            onTap: () async {
                              bookDetails = {
                                'title': data[index].volumeInfo.title,
                                'authors': data[index].volumeInfo.authors,
                                'description':
                                    data[index].volumeInfo.description,
                                'thumbnail': imageUrl,
                                'categories': data[index].volumeInfo.categories
                              };
                              context.pushRoute(
                                PageRouteInfo(
                                  AppRoutes.bookDetails,
                                  args: BookDetailsRouteArgs(
                                    bookDetails: bookDetails,
                                    isbnNumber: data[index]
                                        .volumeInfo
                                        .industryIdentifiers[0]
                                        .identifier,
                                    showHeroImage: true,
                                  ),
                                ),
                              );
                            },
                            child: Hero(
                              tag: data[index].volumeInfo.title,
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(imageUrl),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(4),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.grey,
                                      // blurRadius: 6,
                                      offset: Offset(5, 5),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );

                          // Stack(
                          //   clipBehavior: Clip.none,
                          //   children: [
                          //     Card(
                          //       elevation: 15,
                          //       shape: const RoundedRectangleBorder(),
                          //       child: ClipRRect(
                          //         child: Image.network(
                          //           imageUrl,
                          //         ),
                          //       ),
                          //     ),
                          //     Positioned(
                          //         right: 5,
                          //         top: 10,
                          //         child: Container(
                          //           alignment: Alignment.center,
                          //           decoration: const BoxDecoration(
                          //               color: Color.fromARGB(255, 210, 117, 116),
                          //               borderRadius: BorderRadius.only(
                          //                 topLeft: Radius.circular(
                          //                   5.0,
                          //                 ),
                          //                 bottomLeft: Radius.circular(
                          //                   5.0,
                          //                 ),
                          //               )),
                          //           height: 15,
                          //           width: 50,
                          //           child: const Text(
                          //             "E-Book",
                          //             style: TextStyle(
                          //               fontSize: 10,
                          //               fontWeight: FontWeight.bold,
                          //             ),
                          //           ),
                          //         ))
                          //   ],
                          // );
                        },
                      ),
                    )
                  : SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.7,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 8,
                        itemBuilder: (context, index) {
                          String title = data[index].volumeInfo.title;
                          String author = data[index].volumeInfo.authors[0];
                          String imageUrl = data[index]
                                  .volumeInfo
                                  .imageLinks
                                  .thumbnail
                                  .isNotEmpty
                              ? data[index].volumeInfo.imageLinks.thumbnail
                              : "https://www.ingramspark.com/hs-fs/hubfs/TheSumofAllThings_cover_June21_option4(1).jpg?width=1125&name=TheSumofAllThings_cover_June21_option4(1).jpg";

                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    bookDetails = {
                                      'title': data[index].volumeInfo.title,
                                      'authors': data[index].volumeInfo.authors,
                                      'description':
                                          data[index].volumeInfo.description,
                                      'thumbnail': imageUrl,
                                      'categories':
                                          data[index].volumeInfo.categories
                                    };
                                    context.pushRoute(
                                      PageRouteInfo(
                                        AppRoutes.bookDetails,
                                        args: BookDetailsRouteArgs(
                                          bookDetails: bookDetails,
                                          isbnNumber: data[index]
                                              .volumeInfo
                                              .industryIdentifiers[0]
                                              .identifier,
                                          showHeroImage: true,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Hero(
                                    tag: data[index].volumeInfo.title,
                                    child: Container(
                                      height: 120,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.black45,
                                            // blurRadius: 6,
                                            offset: Offset(5, 5),
                                          ),
                                        ],
                                      ),
                                      child: Image.network(
                                        imageUrl,
                                        fit: BoxFit.cover,
                                        width: 80,
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.5,
                                      child: Text(
                                        "Title: $title",
                                        style: const TextStyle(fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.5,
                                      child: Text(
                                        "By $author",
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                    ),
                                    Slider(
                                      activeColor: Colors.teal,
                                      value: 1.0,
                                      onChanged: (value) {},
                                    ),
                                  ],
                                ),
                                Card(
                                  margin: const EdgeInsets.all(
                                    0.0,
                                  ),
                                  shape: const CircleBorder(),
                                  elevation: 5.0,
                                  color: const Color.fromARGB(
                                    255,
                                    115,
                                    210,
                                    200,
                                  ),
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 40,
                                    width: 40,
                                    child: const Text(
                                      "100%",
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    )
            ],
          ),
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (Object error, StackTrace stackTrace) {
        throw Exception("Error Occured While Fetching booksList : $error");
      },
    );
  }
}
