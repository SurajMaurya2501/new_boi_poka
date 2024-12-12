import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:sample_app/core/constants/app_colors.dart";
import "dart:async";
import "package:sample_app/core/constants/app_images.dart";
import "package:sample_app/core/constants/app_routes.dart";

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  // Function to navigate to home screen after a delay
  void _navigateToHome() {
    Timer(
      const Duration(seconds: 3),
      () async {
        context.pushRoute(PageRouteInfo(AppRoutes.signup,),);
      },
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor:
            AppColors.primaryColor, // Customize the background color
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // App logo
              Image.asset(
                AppImages.appLogo, // Place your logo in the assets folder
              ),
              const SizedBox(height: 20),
              // App name or loading indicator
              const Text(
                "Doctor's Care",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      );
}