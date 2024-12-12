import "package:auto_route/auto_route.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/widgets.dart";
import "package:linkedin_login/linkedin_login.dart";
import "package:sample_app/core/constants/app_routes.dart";

class LinkedinController {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<void> linkedinLogin(
      UserSucceededAction value, BuildContext context,) async {
    if (value.user.name != null) {
      await firebaseAuth.currentUser!.updateDisplayName(value.user.name);
      context.replaceRoute(
        const PageRouteInfo(
          AppRoutes.mainTabView,
        ),
      );
      // Navigator.pushReplacementNamed(context, AppRoutes.navigation);
      print("User Login With Twitter Successfully");
    }
  }
}
