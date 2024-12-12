import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MultiLottieExample extends StatelessWidget {
  const MultiLottieExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          final bool isPortrait = orientation == Orientation.portrait;

          final String lottieAsset1 = isPortrait
              ? 'assets/lottie/portrait.json'
              : 'assets/lottie/landscape1.json';

          final String lottieAsset2 = isPortrait
              ? 'assets/lottie/example.json'
              : 'assets/lottie/landscape2.json';

          return Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildLottieAnimation(
                    asset: lottieAsset1,
                    width: isPortrait ? 200 : 300,
                    height: isPortrait ? 200 : 150,
                  ),
                  const SizedBox(height: 20),
                  _buildLottieAnimation(
                    asset: lottieAsset2,
                    width: isPortrait ? 200 : 300,
                    height: isPortrait ? 200 : 150,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLottieAnimation({
    required String asset,
    required double width,
    required double height,
  }) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Lottie.asset(
        asset,
        width: width,
        height: height,
        fit: BoxFit.contain,
      ),
    );
  }
}
