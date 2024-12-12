import "package:auto_route/auto_route.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:google_sign_in/google_sign_in.dart";
import "package:sample_app/core/constants/app_routes.dart";
import "package:sample_app/data/datasources/shared_preference_impl.dart";

class GoogleLoginController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final SharedPreferenceImpl sharedPref = SharedPreferenceImpl();

  Future<User?> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        return null;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential =
          GoogleAuthProvider.credential(accessToken: googleAuth.accessToken);

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      if (userCredential.user != null) {
        userCredential.user!.updateDisplayName(googleUser.displayName);
        sharedPref.storeData("email", userCredential.user!.email!);
        context.pushRoute(
          const PageRouteInfo(
            AppRoutes.mainTabView,
          ),
        );
        // Navigator.pushNamed(context, AppRoutes.navigation);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Login Failed",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
      return userCredential.user;
    } catch (e) {
      print("Error Occured While Google Login:$e");
      return null;
    }
  }

  Future<void> googleSignOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}
