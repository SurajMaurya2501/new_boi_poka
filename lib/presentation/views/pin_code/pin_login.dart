import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:lottie/lottie.dart";
import "package:pinput/pinput.dart";
import "package:sample_app/core/constants/app_colors.dart";
import "package:sample_app/core/utils/fingerprint_utils.dart";
import "package:sample_app/controller/pin_controller.dart";
import "package:sample_app/controller/shared_pref_controller.dart";
import "package:sample_app/controller/validate_pin_controller.dart";

@RoutePage()
class PinLoginScreen extends StatefulWidget {
  const PinLoginScreen({super.key});

  @override
  State<PinLoginScreen> createState() => _PinLoginScreenState();
}

class _PinLoginScreenState extends State<PinLoginScreen> {
  final SharedPrefController sharedPref = SharedPrefController();
  final ValidatePinImpl validatePin = ValidatePinImpl();
  final FingerprintUtils fingerprintUtils = FingerprintUtils();

  final PinUsecases pinUseCases = PinUsecases();
  final TextEditingController _pinController = TextEditingController();
  Color errorTextColor = Colors.white;
  double errorFontSize = 15;
  PinTheme? defaultPinTheme = PinTheme(
    width: 70,
    height: 65,
    textStyle: const TextStyle(
      fontSize: 22,
      color: Color.fromRGBO(30, 60, 87, 1),
    ),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Colors.transparent),
    ),
  );

  @override
  void initState() {
    sharedPref.getBool("isBiometric").then(
      (bool value) {
        fingerPrintConsent(context, value);
      },
    );

    validatePin.getStoredPin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                top: 90.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Enter your 5 digit pin",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 50),
              child: Pinput(
                readOnly: true,
                length: 5,
                crossAxisAlignment: CrossAxisAlignment.center,
                controller: _pinController,
                errorTextStyle:
                    TextStyle(color: errorTextColor, fontSize: errorFontSize),
                defaultPinTheme: defaultPinTheme,
                textInputAction: TextInputAction.done,
                validator: (value) {
                  return validatePin.validatePin(value, context);
                },
                showCursor: false,
              ),
            ),
            buildNumericKeyboard(),
            GestureDetector(
              onTap: () {
                fingerprintUtils.checkAndSetFingerprint(context);
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.fingerprint,
                    color: Colors.white,
                  ),
                  Text(
                    "USE FINERPRINT",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );

  Widget buildNumericKeyboard() => Padding(
      padding: const EdgeInsets.only(top: 80.0),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, childAspectRatio: 2.0),
        itemCount: 12, // 0-9 digits + clear and backspace
        itemBuilder: (context, index) {
          if (index == 9) {
            return Container();
          } else if (index == 10) {
            return buildNumberButton('0');
          } else if (index == 11) {
            return IconButton(
              onPressed: () {
                cancelNum();
              },
              icon: const Icon(Icons.backspace),
            );
          } else {
            return buildNumberButton('${index + 1}');
          }
        },
      ),
    );

  Widget buildNumberButton(String number) => Container(
      height: 50,
      margin: const EdgeInsets.all(5.0),
      child: TextButton(
        style: const ButtonStyle(
          overlayColor: WidgetStatePropertyAll(
            Color.fromARGB(
              255,
              218,
              218,
              218,
            ),
          ),
          backgroundColor: WidgetStatePropertyAll(Colors.white),
          shape: WidgetStatePropertyAll(
            BeveledRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  2.0,
                ),
              ),
            ),
          ),
        ),
        onPressed: () {
          enterNum(number);
        },
        child: Text(
          number,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(
              255,
              93,
              93,
              93,
            ),
          ),
        ),
      ),
    );

  void enterNum(String? number) {
    if (number != null &&
        number.isNotEmpty &&
        _pinController.text.length <= 4) {
      _pinController.text += number;
      setState(() {});
    }
  }

  void cancelNum() {
    if (_pinController.text.trim().isNotEmpty) {
      if (_pinController.text.length == 1) {
        _pinController.clear();
      } else {
        _pinController.text =
            _pinController.text.substring(0, _pinController.text.length - 1);
        print(_pinController.text.substring(0, _pinController.text.length - 1));
      }

      setState(() {});
    }
  }

  Future<void> fingerPrintConsent(BuildContext context, bool value) async {
    Future.delayed(
      const Duration(
        seconds: 1,
      ),
      () async {
        if (!value) {
          await showDialog(
            context: context,
            builder: (BuildContext context) => Dialog(
                child: Container(
                  alignment: Alignment.center,
                  height: 200,
                  width: 220,
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Lottie.asset(
                          repeat: false,
                          "assets/lottie/fingerprint_lottie.dart.json",
                          height: 50,
                          width: 50),
                      const Padding(
                        padding: EdgeInsets.all(
                          8.0,
                        ),
                        child: Text(
                          'Please Allow to enable\nFingerprint login',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              style: ButtonStyle(
                                  backgroundColor: WidgetStatePropertyAll(
                                      AppColors.primaryColor)),
                              onPressed: () {
                                sharedPref.setBool("isBiometric", false);
                              },
                              child: const Text(
                                "Deny",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextButton(
                              style: ButtonStyle(
                                side: WidgetStatePropertyAll(
                                  BorderSide(
                                    color: AppColors.primaryColor,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                              onPressed: () {
                                sharedPref.setBool("isBiometric", true);
                              },
                              child: const Text(
                                "Allow",
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
          );
        } else {
          fingerprintUtils.checkAndSetFingerprint(context);
        }
      },
    );
  }

}
