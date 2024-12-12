import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:lottie/lottie.dart";

@RoutePage()
class NoInternetConnection extends StatelessWidget {
  const NoInternetConnection({super.key});

  @override
  Widget build(BuildContext context) => Material(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              height: 80,
              width: 80,
              repeat: false,
              "assets/lottie/no_internet.json",
            ),
            const Text(
              "No Internet Connection",
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
}
