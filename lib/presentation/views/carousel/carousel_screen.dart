import "package:auto_route/auto_route.dart";
import "package:carousel_slider/carousel_slider.dart";
import "package:flutter/material.dart";
import "package:sample_app/core/constants/app_colors.dart";
import "package:sample_app/core/constants/app_images.dart";
import "package:sample_app/core/constants/app_routes.dart";
import "package:sample_app/core/constants/app_typography.dart";
import "package:sample_app/presentation/views/carousel/widgets/custom_dots.dart";

class CarouselScreen extends StatefulWidget {
  const CarouselScreen({super.key});

  @override
  State<CarouselScreen> createState() => _CarouselScreenState();
}

class _CarouselScreenState extends State<CarouselScreen> {
  final List<String> _images = <String>[AppImages.spaceBoy, AppImages.studyGirl];
  final CarouselSliderController carouselSliderController = CarouselSliderController();
  int _selectedIndex = 0;
  bool autoPlay = false;
  bool enableInfiniteScroll = false;
  int autoPlayInterval = 10;
  bool enlargeCentre = true;

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Stack(
        children: [
          //App Logo Position

          Positioned(
            left: 10.0,
            top: 50.0,
            child: Row(
              children: [
                Image.asset(AppImages.appLogo),
                Padding(
                  padding: const EdgeInsets.all(
                    10.0,
                  ),
                  child: Text(
                    "Digital Salts",
                    style: AppTypography.typo16WhiteRegular,
                  ),
                )
              ],
            ),
          ),

          //Center Carousel Screen

          Center(
            child: CarouselSlider(
              carouselController: carouselSliderController,
              options: CarouselOptions(
                height: 500.0,
                viewportFraction: 0.9,
                enableInfiniteScroll: enableInfiniteScroll,
                autoPlay: autoPlay,
                autoPlayInterval: Duration(seconds: autoPlayInterval),
                enlargeCenterPage: enlargeCentre,
                onPageChanged: (index, reason) {
                  _selectedIndex = index;
                  setState(() {});
                },
              ),
              items: List.generate(
                _images.length,
                (index) {
                  return Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Image.asset(
                      _images[index],
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(
            bottom: 120,
            left: MediaQuery.sizeOf(context).width * 0.45,
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _images.length,
                  (index) => buildDot(index, context, _selectedIndex),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              context.pushRoute(
                const PageRouteInfo(
                  AppRoutes.mainTabView,
                ),
              );
              // Navigator.pushNamed(context, AppRoutes.navigation);
            },
            child: Container(
              alignment: Alignment.center,
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(
                  5.0,
                ),
              ),
              child: Text(
                "Skip",
                style: AppTypography.typo16PrimarySemibold,
              ),
            ),
          ),
          const SizedBox(
            width: 5.0,
          ),
          GestureDetector(
            onTap: () {
              if (_selectedIndex != _images.length - 1) {
                carouselSliderController.nextPage();
              } else {
                // Navigator.pushNamed(context, AppRoutes.navigation);
                context.pushRoute(
                  const PageRouteInfo(
                    AppRoutes.mainTabView,
                  ),
                );
              }
            },
            child: Container(
              alignment: Alignment.center,
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                border: Border.all(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(
                  5.0,
                ),
              ),
              child: Text(
                "Next",
                style: AppTypography.typo16WhiteRegular,
              ),
            ),
          ),
        ],
      ),
    );

}
