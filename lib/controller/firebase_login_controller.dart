import "package:auto_route/auto_route.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:sample_app/core/constants/app_routes.dart";
import "package:sample_app/controller/shared_pref_controller.dart";

class FirebaseLoginController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final SharedPrefController sharedPref = SharedPrefController();

  Future<void> signupWithEmail(String email, String password,
      BuildContext context, String userName,) async {
    try {
      final UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        sharedPref.setData("email", email);
        await userCredential.user!.updateDisplayName(userName);
        context.pushRoute(
          const PageRouteInfo(
            AppRoutes.mainTabView,
          ),
        );
        // Navigator.pushNamed(context, AppRoutes.signin);
      }
    } on FirebaseAuthException catch (e) {
      if (e.toString() ==
          "[firebase_auth/email-already-in-use] The email address is already in use by another account.") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Email Already in Use",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
      print("Error Occured While Sign up With Email:$e");
    }
  }

  Future<void> loginWithEmail(
      String email, String password, BuildContext context,) async {
    try {
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password,);
      if (userCredential.user != null) {
        sharedPref.setData("email", email);
        // Navigator.pushNamed(context, AppRoutes.navigation);
        context.pushRoute(
          const PageRouteInfo(
            AppRoutes.mainTabView,
          ),
        );
        print("Login Successfully!");
      }
    } catch (e) {
      if (e.toString() ==
          "[firebase_auth/invalid-credential] The supplied auth credential is incorrect, malformed or has expired.") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Email or Password is Incorrect",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
      Navigator.pop(context);

      print("Error Occured while login with email:$e");
    }
  }

  Future<void> firebaseSignOut() async {
    await _auth.signOut();
  }
}
