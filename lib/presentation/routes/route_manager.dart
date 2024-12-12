import "package:flutter/material.dart";
import "package:sample_app/core/constants/app_routes.dart";
import "package:sample_app/main.dart";
import "package:sample_app/core/utils/pageroutebuilder.dart";
import "package:sample_app/presentation/views/login/linkdin.dart";
import "package:sample_app/presentation/views/login/signup.dart";
import "package:sample_app/presentation/views/no_internet_connection/no_internet_connection.dart";
import "package:sample_app/presentation/views/navigation/navigation_screen.dart";
import "package:sample_app/presentation/views/pin_code/pin_login.dart";
import "package:sample_app/presentation/views/pin_code/pin_setup.dart";
import "package:sample_app/presentation/views/splash/splash.dart";
import "package:sample_app/presentation/views/welcome/welcomepage.dart";

class RouteManager {
  static Route<dynamic>? generateRoutes(RouteSettings settings) {
    if (connectionResult?.first.name != "none") {
      switch (settings.name) {
        case AppRoutes.splash:
          return createRoute(const SplashScreen());
        // case AppRoutes.signin:
        //   return createRoute(const SignInScreen());
        case AppRoutes.signup:
          return createRoute(const SignUpScreen());
        case AppRoutes.pinSetup:
          return createRoute(const PinSetupScreen());
        case AppRoutes.pinLogin:
          return createRoute(const PinLoginScreen());
        case AppRoutes.navigation:
          return createRoute(const NavigationScreen());
        case AppRoutes.linkedin:
          return createRoute(LinkedinLogin());
        case AppRoutes.welcome:
          return createRoute(const Welcomepage());
        default:
          return createRoute(const SignUpScreen());
      }
    } else {
      return createRoute(const NoInternetConnection());
    }
  }
  
}
