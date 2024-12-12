import "package:flutter/material.dart";

class CustomKeypad extends StatefulWidget {
  const CustomKeypad(
      {super.key,
      required this.confirmPinController,
      required this.pinController,
      required this.selectedIndex});
  final TextEditingController pinController;
  final TextEditingController confirmPinController;
  final int selectedIndex;

  @override
  _CustomKeypadState createState() => _CustomKeypadState();


}

class _CustomKeypadState extends State<CustomKeypad> {
  @override
  Widget build(BuildContext context) => Padding(
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
          enterNum(number, widget.selectedIndex);
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

  void enterNum(String? number, int selectedIndex) {
    if (number != null &&
        number.isNotEmpty &&
        widget.pinController.text.length <= 4 &&
        selectedIndex == 0) {
      widget.pinController.text += number;
      setState(() {});
    } else if (number != null &&
            number.isNotEmpty &&
            widget.confirmPinController.text.length <= 4 ||
        selectedIndex == 1) {
      widget.confirmPinController.text += number!;
      setState(() {});
    }
  }

  void cancelNum() {
    if (widget.pinController.text.trim().isNotEmpty &&
        widget.confirmPinController.text.isEmpty) {
      if (widget.pinController.text.length == 1) {
        widget.pinController.clear();
      } else {
        widget.pinController.text = widget.pinController.text
            .substring(0, widget.pinController.text.length - 1);
        print(widget.pinController.text
            .substring(0, widget.pinController.text.length - 1),);
      }

      setState(() {});
    } else if (widget.confirmPinController.text.trim().isNotEmpty) {
      if (widget.confirmPinController.text.length == 1) {
        return widget.confirmPinController.clear();
      } else {
        widget.confirmPinController.text = widget.confirmPinController.text
            .substring(0, widget.confirmPinController.text.length - 1);
        print(widget.confirmPinController.text
            .substring(0, widget.confirmPinController.text.length - 1),);
      }
    }
  }
}
