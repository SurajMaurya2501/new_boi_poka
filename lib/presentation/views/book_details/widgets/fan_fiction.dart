import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class FanFiction extends StatefulWidget {
  final List<dynamic> fanFictionData;
  const FanFiction({required this.fanFictionData, super.key});

  @override
  State<FanFiction> createState() => _FanFictionState();
}

class _FanFictionState extends State<FanFiction> {
  final CardSwiperController controller = CardSwiperController();
  List<dynamic> fanfiction = [];

  @override
  void initState() {
    addExpertReviews(widget.fanFictionData);
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
            child: fanfiction.isNotEmpty
                ? CardSwiper(
                    allowedSwipeDirection:
                        AllowedSwipeDirection.only(left: true, right: true,),
                    controller: controller,
                    cardsCount: fanfiction.length,
                    onSwipe: _onSwipe,
                    onUndo: _onUndo,
                    numberOfCardsDisplayed: 3,
                    backCardOffset: const Offset(20, 20),
                    padding: const EdgeInsets.all(24.0),
                    cardBuilder: (context, index, horizontalThresholdPercentage,
                        verticalThresholdPercentage) {
                      return FictionCard(fanfiction[index]);
                    },
                  )
                : SizedBox(
                    height: screenHeight * 0.5,
                    width: 325,
                    child: const FictionCard(
                      {
                        "author": "Author Name",
                        'short_description': "Short Description",
                        "likes": 4.0
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

  Future<void> addExpertReviews(List<dynamic> data) async {
    if (data.isNotEmpty) {
      fanfiction = data;
    }
  }
}

class FictionCard extends StatelessWidget {
  final Map<String, dynamic> review;

  const FictionCard(this.review, {super.key});

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
                review['author'] ?? 'Unknown Author',
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
                review['short_description:'] ?? 'No description available',
                style: const TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 12),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Icon(
                Icons.favorite,
                color: Colors.red,
                size: 20,
              ),
              Text(
                (review['likes'] ?? 0).toString(),
                style: const TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ]),
            const SizedBox(height: 4),
          ],
        ),
      ),
    );
  }
}
