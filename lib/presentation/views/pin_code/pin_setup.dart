import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:pinput/pinput.dart";
import "package:sample_app/core/constants/app_colors.dart";
import "package:sample_app/controller/pin_controller.dart";
import "package:sample_app/controller/validate_pin_controller.dart";
import "package:sample_app/presentation/views/pin_code/widgets/custom_keypad.dart";

@RoutePage()
class PinSetupScreen extends StatefulWidget {
  const PinSetupScreen({super.key});

  @override
  State<PinSetupScreen> createState() => _PinSetupScreenState();
}

class _PinSetupScreenState extends State<PinSetupScreen> {
  final int _selectedIndex = 0;
  final ValidatePinImpl validatePin = ValidatePinImpl();
  final PinUsecases pinUseCases = PinUsecases();
  final TextEditingController _pinController = TextEditingController();
  final TextEditingController _confirmPinController = TextEditingController();
  Color errorTextColor = Colors.white;
  double errorFontSize = 15;
  PinTheme? defaultPinTheme = PinTheme(
    width: 60,
    height: 60,
    textStyle: const TextStyle(
      fontSize: 30,
      color: Color.fromRGBO(30, 60, 87, 1),
    ),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: Colors.transparent),
    ),
  );

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 90.0, bottom: 20.0, left: 10.0),
              child: Row(
                children: [
                  Text(
                    "Set a 5 digit pin",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
            Pinput(
              obscureText: true,
              readOnly: true,
              length: 5,
              crossAxisAlignment: CrossAxisAlignment.center,
              controller: _pinController,
              errorTextStyle:
                  TextStyle(color: errorTextColor, fontSize: errorFontSize),
              defaultPinTheme: defaultPinTheme,
              textInputAction: TextInputAction.done,
              validator: (value) {
                return null;
              },
              showCursor: false,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30.0, bottom: 20.0, left: 10.0),
              child: Row(
                children: [
                  Text(
                    "Confirm 5 digit pin",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
            Pinput(
              obscureText: true,
              readOnly: true,
              length: 5,
              crossAxisAlignment: CrossAxisAlignment.center,
              controller: _confirmPinController,
              errorTextStyle: TextStyle(
                color: errorTextColor,
                fontSize: errorFontSize,
              ),
              defaultPinTheme: defaultPinTheme,
              textInputAction: TextInputAction.done,
              validator: (value) {
                return validatePin.verifyConfrimPin(
                    _pinController.text, _confirmPinController.text, context);
              },
              showCursor: false,
            ),
            const Spacer(),
            CustomKeypad(
                confirmPinController: _confirmPinController,
                pinController: _pinController,
                selectedIndex: _selectedIndex)
          ],
        ),
      ),
    );

}
