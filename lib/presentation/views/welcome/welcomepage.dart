import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sample_app/core/constants/app_images.dart';
import 'package:sample_app/core/constants/app_routes.dart';
import 'package:sample_app/presentation/views/carousel/widgets/custom_dots.dart';

@RoutePage()
class Welcomepage extends StatefulWidget {
  const Welcomepage({super.key});

  @override
  State<Welcomepage> createState() => _WelcomepageState();
}

class _WelcomepageState extends State<Welcomepage> {
  final List<String> _images = [
    AppImages.books,
    AppImages.fishermen,
    AppImages.books2,
    AppImages.studyGirl,
  ];
  final carouselSliderController = CarouselSliderController();
  int _selectedIndex = 0;
  bool autoPlay = false;
  bool enableInfiniteScroll = false;
  int autoPlayInterval = 10;
  bool enlargeCentre = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'welcome to',
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
          ),
          const Text(
            'BOI-POKA',
            style: TextStyle(
              fontFamily: "Playfair Display",
              fontWeight: FontWeight.w500,
              fontSize: 40,
            ),
          ),
          CarouselSlider(
            carouselController: carouselSliderController,
            options: CarouselOptions(
              height: MediaQuery.sizeOf(context).height * 0.5,
              viewportFraction: 0.9,
              enableInfiniteScroll: enableInfiniteScroll,
              autoPlay: autoPlay,
              autoPlayInterval: Duration(seconds: autoPlayInterval),
              enlargeCenterPage: enlargeCentre,
              onPageChanged: (index, reason) {
                _selectedIndex = index;
                if (_selectedIndex == _images.length - 1) {
                  Future.delayed(
                    const Duration(
                      seconds: 3,
                    ),
                    () {
                      context.pushRoute(
                        PageRouteInfo(
                          AppRoutes.selectAndRegister,
                        ),
                      );
                    },
                  );
                }
                setState(() {});
              },
            ),
            items: List.generate(
              _images.length,
              (index) {
                return Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 5.0,
                  ),
                  child: Image.asset(
                    _images[index],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _images.length,
                (index) => buildDot(index, context, _selectedIndex),
              ),
            ),
          ),
          SizedBox(
            height: 45,
            width: 145,
            child: ElevatedButton(
              onPressed: () {
                context.pushRoute(
                  PageRouteInfo(
                    AppRoutes.home,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(
                  255,
                  255,
                  232,
                  27,
                ),
              ),
              child: const Text(
                'SKIP',
                style: TextStyle(
                  fontFamily: "Playfair Display",
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
