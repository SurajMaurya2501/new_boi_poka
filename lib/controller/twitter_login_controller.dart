import "package:auto_route/auto_route.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/widgets.dart";
import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:sample_app/controller/shared_pref_controller.dart";
import "package:sample_app/core/constants/app_routes.dart";
import "package:twitter_login/entity/auth_result.dart";
import "package:twitter_login/twitter_login.dart";

class TwitterLoginController {
  final TwitterLogin twitterAuth = TwitterLogin(
      apiKey: dotenv.env["Twitter_Api_Key"]!,
      apiSecretKey: dotenv.env["Twitter_Api_Secret_Key"]!,
      redirectURI: "https://kip-shopping.firebaseapp.com/__/auth/handler",);

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final SharedPrefController sharedPrefImp = SharedPrefController();

  Future<void> twitterLogin(BuildContext context) async {
    try {
      final AuthResult result = await twitterAuth.loginV2();
      context.pushRoute(
            PageRouteInfo(
              AppRoutes.mainTabView,
            ),
          );
      // Navigator.pushNamed(context, AppRoutes.home);
    } catch (e) {
      print("Error occured while login with Twitter:$e");
    }
  }
}
