import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:sample_app/controller/pin_controller.dart';
import 'package:sample_app/controller/validate_pin_controller.dart';

class PinSetupScreen extends StatefulWidget {
  const PinSetupScreen({super.key});

  @override
  State<PinSetupScreen> createState() => _PinSetupScreenState();
}

class _PinSetupScreenState extends State<PinSetupScreen> {
  final int _selectedIndex = 0;
  final validatePin = ValidatePinImpl();
  final pinUseCases = PinUsecases();
  final _pinController = TextEditingController();
  final _confirmPinController = TextEditingController();
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 51, 51, 51),
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
            buildNumericKeyboard(),
          ],
        ),
      ),
    );
  }

  Widget buildNumericKeyboard() {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
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
  }

  Widget buildNumberButton(String number) {
    return Container(
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
          backgroundColor: WidgetStatePropertyAll(
            Colors.white,
          ),
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
          enterNum(number, _selectedIndex);
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
  }

  void enterNum(String? number, int selectedIndex) {
    if (number != null &&
        number.isNotEmpty &&
        _pinController.text.length <= 4 &&
        selectedIndex == 0) {
      _pinController.text += number;
      setState(() {});
    } else if (number != null &&
            number.isNotEmpty &&
            _confirmPinController.text.length <= 4 ||
        selectedIndex == 1) {
      _confirmPinController.text += number!;
      setState(() {});
    }
  }

  void cancelNum() {
    if (_pinController.text.trim().isNotEmpty &&
        _confirmPinController.text.isEmpty) {
      if (_pinController.text.length == 1) {
        _pinController.clear();
      } else {
        _pinController.text =
            _pinController.text.substring(0, _pinController.text.length - 1);
      }

      setState(() {});
    } else if (_confirmPinController.text.trim().isNotEmpty) {
      if (_confirmPinController.text.length == 1) {
        return _confirmPinController.clear();
      } else {
        _confirmPinController.text = _confirmPinController.text
            .substring(0, _confirmPinController.text.length - 1);
         }
    }
  }
}
