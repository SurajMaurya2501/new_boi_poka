import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class ExpertCardreview extends StatefulWidget {
  final List<dynamic> expertReviewsData;
  const ExpertCardreview({required this.expertReviewsData, super.key});

  @override
  State<ExpertCardreview> createState() => _ExpertCardreviewState();
}

class _ExpertCardreviewState extends State<ExpertCardreview> {
  final CardSwiperController controller = CardSwiperController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: screenHeight * 0.5,
            width: 325,
            child: widget.expertReviewsData.isNotEmpty
                ? CardSwiper(
                    allowedSwipeDirection:
                        AllowedSwipeDirection.only(left: true, right: true),
                    controller: controller,
                    cardsCount: widget.expertReviewsData.length,
                    onSwipe: _onSwipe,
                    onUndo: _onUndo,
                    numberOfCardsDisplayed: 3,
                    backCardOffset: const Offset(20, 20),
                    padding: const EdgeInsets.all(24.0),
                    cardBuilder: (context, index, horizontalThresholdPercentage,
                        verticalThresholdPercentage) {
                      return ExampleCard(
                        widget.expertReviewsData[index],
                      );
                    },
                  )
                : SizedBox(
                    height: screenHeight * 0.5,
                    width: 325,
                    child: const ExampleCard(
                      {
                        "name": "Author Name",
                        'text': "Short Description",
                        "rating": 4.0
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  bool _onSwipe(
      int previousIndex, int? currentIndex, CardSwiperDirection direction) {
    debugPrint(
      'The card $previousIndex was swiped to the ${direction.name}. Now the card $currentIndex is on top',
    );
    return true;
  }

  bool _onUndo(
      int? previousIndex, int currentIndex, CardSwiperDirection direction) {
    debugPrint(
      'The card $currentIndex was undone from the ${direction.name}',
    );
    return true;
  }
}

class ExampleCard extends StatelessWidget {
  final Map<String, dynamic> review;

  const ExampleCard(this.review, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade200,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                review['name'],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                review['text'],
                style: const TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return Icon(
                  index < review['rating'] ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                  size: 20,
                );
              }),
            ),
            const SizedBox(height: 4),
            Text(
              review['rating'].toString(),
              style: const TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
