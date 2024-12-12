import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:linkedin_login/linkedin_login.dart';
import 'package:sample_app/controller/linkedin_controller.dart';


@RoutePage()
class LinkedinLogin extends StatelessWidget {
   LinkedinLogin({super.key});

  final _linkedinController = LinkedinController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height,
              width: double.infinity,
              child: LinkedInUserWidget(
                  destroySession: true,
                  onGetUserProfile: (value) {
                    _linkedinController.linkedinLogin(value, context);
                  },
                  redirectUrl:
                      "https://kip-shopping.firebaseapp.com/__/auth/handler",
                  clientId: "7782pgylvgqw62",
                  clientSecret: "WPL_AP1.OTnpEX7qaxPQy4q6.IKpePg=="),
            )
          ],
        ),
      ),
    );
  }
}
