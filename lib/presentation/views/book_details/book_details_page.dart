import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_app/core/constants/app_routes.dart';
import 'package:sample_app/presentation/custom_widgets/circularchart.dart';
import 'package:sample_app/presentation/custom_widgets/piechart.dart';
import 'package:sample_app/presentation/custom_widgets/sentimentmeter.dart';
import 'package:sample_app/presentation/provider/book_details_provider.dart';
import 'package:sample_app/presentation/views/book_details/books_by_author.dart';
import 'package:sample_app/presentation/views/book_details/similar_books.dart';
import 'package:sample_app/presentation/views/book_details/widgets/curve_graph.dart';
import 'package:sample_app/presentation/views/book_details/widgets/expert_cardreview.dart';
import 'package:sample_app/presentation/views/book_details/widgets/fan_fiction.dart';
import 'package:sample_app/presentation/views/book_details/widgets/image_view.dart';
import 'package:sample_app/presentation/views/book_details/widgets/no_image_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

@RoutePage()
class BookDetailsPage extends ConsumerWidget {
  final Map<String, dynamic> bookDetails;
  final String isbnNumber;
  final bool showHeroImage;
  const BookDetailsPage(
      {required this.bookDetails,
      required this.isbnNumber,
      required this.showHeroImage,
      super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getBookDetails = ref.watch(getSelectedBooksDetailsProvider);
    Map<String, dynamic> popularityList = {};
    Map<String, dynamic> sentiments = {};
    Map<String, dynamic> bookMoodList = {};
    dynamic expertReviewsData = [];
    dynamic fanFictionData = [];
    String? bookTitle = "";
    List<dynamic> bookAuthor = [];
    String? bookDescription = "No Description available";
    String? bookThumbnail = bookDetails['thumbnail'] ?? '';
    bool isLoading = true;
    getBookDetails.whenData(
      (value) {
        popularityList = value['popularity_country'];
        sentiments = value['sentiment'];
        bookMoodList = value['book_read_mood'];
        expertReviewsData = value['expert_reviews'];
        fanFictionData = value['fan_fiction'];
        bookTitle = bookDetails['title'] ?? "";
        bookAuthor = value['authors'];
        bookDescription =
            bookDetails['description'] ?? "No Description available";
        bookThumbnail = bookDetails['thumbnail'] ?? '';
        isLoading = false;
      },
    );

    return Scaffold(
        // appBar: const CommonAppBar(title: 'BP'),
        body: CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          flexibleSpace: FlexibleSpaceBar(
              stretchModes: [StretchMode.fadeTitle, StretchMode.blurBackground],
              background: DecoratedBox(
                decoration: BoxDecoration(color: Colors.blue),
                child: Icon(Icons.refresh),
              )),
          stretch: true,
          onStretchTrigger: () async {
            ref.refresh(getSelectedBooksDetailsProvider).whenData(
              (value) {
                popularityList = value['popularity_country'];
                sentiments = value['sentiment'];
                bookMoodList = value['book_read_mood'];
                expertReviewsData = value['expert_reviews'];
                fanFictionData = value['fan_fiction'];
                bookTitle = bookDetails['title'] ?? "";
                bookAuthor = value['authors'];
                bookDescription =
                    bookDetails['description'] ?? "No Description available";
                bookThumbnail = bookDetails['thumbnail'] ?? '';
                isLoading = false;
              },
            );
          },
          title: Text("BP"),
          actions: [
            GestureDetector(
              child: Container(
                margin: EdgeInsets.all(5.0),
                width: 25,
                height: 25,
                child: Image.asset(
                  'assets/images/user.png',
                  fit: BoxFit.fill,
                  // color: Colors.yellow.shade600,
                ),
              ),
              onTap: () {
                context.pushRoute(
                  PageRouteInfo(
                    AppRoutes.profile,
                  ),
                );
              },
            ),
          ],
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Column(
              children: [
                const SizedBox(height: 10),
                Center(
                  child: Column(
                    children: [
                      showHeroImage
                          ? Hero(
                              tag: bookDetails['title'],
                              child: ImageViewWidget(
                                bookThumbnail: bookThumbnail!,
                              ))
                          : bookThumbnail!.isNotEmpty
                              ? Skeletonizer(
                                  enabled: isLoading,
                                  child: ImageViewWidget(
                                    bookThumbnail: bookThumbnail!,
                                  ))
                              : NoImageWidget(
                                  blurRadius: 2,
                                  boxShadowOffSet: Offset(
                                    10.0,
                                    10.0,
                                  ),
                                  height: 300,
                                  width: 200,
                                ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                  child: Row(
                    children: [
                      if (bookTitle != null) ...[
                        Expanded(
                          child: Text('Title: $bookTitle',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Row(
                    children: [
                      ...List.generate(
                        bookAuthor.length,
                        (index) {
                          return Text(
                            'Author: ${bookAuthor[index]}',
                            style: const TextStyle(color: Colors.grey),
                          );
                        },
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Row(
                    children: [
                      if (bookDescription != null) ...[
                        Expanded(
                          child: Text(
                            'Description:\n$bookDescription',
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                //Pie Chart Widget

                Skeletonizer(
                  enabled: isLoading,
                  child: Card(
                    child: PieChartWidget(
                      popularityPercentageList: popularityList,
                    ),
                  ),
                ),

                const SizedBox(height: 10),
                Row(
                  children: [
                    //YAY vs NAY

                    Expanded(
                      child: SizedBox(
                        height: 290,
                        child: Card(
                          color: Colors.grey.shade200,
                          child: const Padding(
                            padding: EdgeInsets.all(20.0),
                            child: CircularProgressChart(
                              title: 'YAY v/s NAY',
                              percentage: 25,
                            ),
                          ),
                        ),
                      ),
                    ),

                    //SENTIMENT ANALYSIS

                    Expanded(
                      child: Skeletonizer(
                        effect: const ShimmerEffect(
                          baseColor: Colors.black12,
                        ),
                        enabled: isLoading,
                        child: SizedBox(
                          height: 290,
                          child: Card(
                            // color: Colors.grey.shade200,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: SentimentMeter(
                                sentiments: sentiments,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                //Book Mood Graph

                const SizedBox(height: 10),

                Skeletonizer(
                  effect: const ShimmerEffect(
                    baseColor: Colors.black12,
                  ),
                  enabled: isLoading,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 5.0,
                      child: CurveGraph(
                        bookMoodData: bookMoodList,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                const Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Row(
                    children: [
                      Text(
                        'EXPERT REVIEWS',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),

                //Expert Reviews Part

                Skeletonizer(
                  enabled: isLoading,
                  effect: const ShimmerEffect(
                    baseColor: Colors.black12,
                  ),
                  child: ExpertCardreview(
                    expertReviewsData: expertReviewsData,
                  ),
                ),

                const SizedBox(
                  height: 30,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Row(
                    children: [
                      Text(
                        'FAN FICTION',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                //Fan Fiction Part

                Skeletonizer(
                  enabled: isLoading,
                  effect: const ShimmerEffect(
                    baseColor: Colors.black12,
                  ),
                  child: FanFiction(
                    fanFictionData: fanFictionData,
                  ),
                ),

                const SizedBox(height: 30),
                const Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Row(
                    children: [
                      Text(
                        'SIMILAR BOOKS, NOT ON YOUR SHELF',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                BooksByAuthor(
                  authorName: bookDetails['authors'][0],
                ),

                const Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Row(
                    children: [
                      Text(
                        'BOOKS BY GENERE',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                SimilarBooks(
                  category: bookDetails['categories'][0],
                ),

                const SizedBox(
                  height: 7,
                ),
              ],
            ),
          ]),
        )
      ],
    ));
  }
}
