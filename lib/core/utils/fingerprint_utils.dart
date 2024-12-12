import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:local_auth/local_auth.dart";
import "package:sample_app/core/constants/app_routes.dart";

//This is used for fingerprint functionality
class FingerprintUtils { 
  
  final LocalAuthentication localAuth = LocalAuthentication();
  
  Future<void> checkAndSetFingerprint(BuildContext context) async {
    if (await localAuth.canCheckBiometrics) {
      await localAuth
          .authenticate(localizedReason: "Please authenticate to login")
          .then(
        (bool value) {
          if (value) {
            context.pushRoute(
              const PageRouteInfo(
                AppRoutes.mainTabView,
              ),
            );
            // Navigator.pushNamed(context, AppRoutes.signin);
          }
        },
      );
    }
  }

    Future<bool> isFingerprintAvailable() async {
    return await localAuth.canCheckBiometrics;
  }
}
