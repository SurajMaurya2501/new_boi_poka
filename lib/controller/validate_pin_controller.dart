import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:sample_app/core/constants/app_routes.dart";
import "package:sample_app/controller/pin_controller.dart";

class ValidatePinImpl {
  final PinUsecases repostiroy = PinUsecases();
  String? storedPin;

  String? validatePin(String? value, BuildContext context) {
    print("Stored Pin - $storedPin");
    if (value != storedPin) {
      return "Incorrect Pin";
    } else if (value == storedPin) {
      context.pushRoute(
        const PageRouteInfo(
          AppRoutes.splash,
        ),
      );
      context.pushRoute(
        const PageRouteInfo(
          AppRoutes.mainTabView,
        ),
      );
      // Navigator.pushNamed(context, AppRoutes.splash);
    }
    return null;
  }

  String? verifyConfrimPin(
      String? pin, String? confirmPin, BuildContext context,) {
    if (pin == confirmPin) {
      repostiroy.storePin(pin!).whenComplete(
        () {
          context.pushRoute(
              const PageRouteInfo(
                AppRoutes.pinLogin,
              ),
            );
          // Navigator.pushNamed(context, AppRoutes.pinLogin);
        },
      );
    } else {
      return "Confirm pin not matched";
    }
    return null;
  }

  Future<void> getStoredPin() async {
    storedPin = await repostiroy.getPin();
  }
}
