import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sample_app/controller/shared_pref_controller.dart';
import 'package:sample_app/core/constants/app_routes.dart';
import 'package:sample_app/core/constants/app_typography.dart';
import 'package:sample_app/core/utils/fingerprint_utils.dart';

@RoutePage()
class AuthConsentScreen extends StatefulWidget {
  const AuthConsentScreen({super.key});

  @override
  State<AuthConsentScreen> createState() => _AuthConsentScreenState();
}

class _AuthConsentScreenState extends State<AuthConsentScreen> {
  List<bool> fingerPrintToggleBool = []; // "No" is initially selected
  List<bool> mpinToggleBool = [];
  final sharedPref = SharedPrefController();
  final fingerPrintAuth = FingerprintUtils();
  bool isMpin = false;
  bool isLoading = true;

  @override
  void initState() {
    presetToggleButtons().whenComplete(
      () {
        isLoading = false;
        setState(() {});
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                const Text(
                  "BOI-POKA",
                  style: AppTypography.typo40BlackNormal,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 30.0, bottom: 20.0),
                      child: Text(
                        "Security Settings",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
                customToggle(
                    "Enable Fingerprint", 0, FontAwesomeIcons.fingerprint),
                const Text(
                  "OR",
                  style: AppTypography.typo16MediumkBold,
                ),
                customToggle("Set MPIN", 1, FontAwesomeIcons.lock),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.only(bottom: 50.0),
                  width: 150,
                  height: 50.0,
                  child: TextButton(
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Colors.amber,
                      ),
                    ),
                    onPressed: () async {
                      context.pushRoute(
            PageRouteInfo(
              AppRoutes.mainTabView,
            ),
          );
                      // Navigator.pushNamed(context, AppRoutes.home);
                    },
                    child: const Text(
                      "ALLOW",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Widget customToggle(String text, int selectedIndex, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          30.0,
        ),
        border: Border.all(
          color: Colors.grey,
          width: 2,
        ),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(
        children: [
          Icon(
            icon,
          ),
          const SizedBox(
            width: 10.0,
          ),
          Text(
            text,
            style: AppTypography.typo16MediumkBold,
          ),
          const Spacer(),
          ToggleButtons(
            isSelected:
                selectedIndex == 0 ? fingerPrintToggleBool : mpinToggleBool,
            onPressed: (int index) {
              if (selectedIndex == 0) {
                reset(selectedIndex);
                fingerPrintToggleBool[index] = !fingerPrintToggleBool[index];
                if (index == 1) {
                  sharedPref.setBool("isFingerprint", true);
                } else {
                  sharedPref.setBool("isFingerprint", false);
                }
              }
              if (selectedIndex == 1) {
                reset(selectedIndex);
                mpinToggleBool[index] = !mpinToggleBool[index];
                if (index == 1) {
                  sharedPref.setBool("isMpin", true);

                  //Navigate only if mPin is not stored
                  if (isMpin == false) {
                    // Navigator.pushNamed(context, AppRoutes.pinSetup);
                    context.pushRoute(
            PageRouteInfo(
              AppRoutes.pinSetup,
            ),
          );
                  }
                } else {
                  sharedPref.deleteData("isMpin");
                  isMpin = false;
                }
              }
              setState(() {});
            },
            fillColor: Colors.green, // Color when button is selected
            selectedColor: Colors.white,
            color: Colors.black, // Color when button is not selected
            borderRadius: BorderRadius.circular(10),
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text("No"),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text("Yes"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void reset(int selectedIndex) {
    if (selectedIndex == 0) {
      fingerPrintToggleBool = List.generate(
        2,
        (index) => false,
      );
    } else if (selectedIndex == 1) {
      mpinToggleBool = List.generate(
        2,
        (index) => false,
      );
    }
  }

  Future<void> presetToggleButtons() async {
    bool isFingerPrint = await sharedPref.getBool("isFingerprint");
    isMpin = await sharedPref.getBool("isMpin");

    if (isFingerPrint) {
      fingerPrintToggleBool = [false, true];
    } else {
      fingerPrintToggleBool = [true, false];
    }
    if (isMpin) {
      mpinToggleBool = [false, true];
    } else {
      mpinToggleBool = [true, false];
    }
  }
}
