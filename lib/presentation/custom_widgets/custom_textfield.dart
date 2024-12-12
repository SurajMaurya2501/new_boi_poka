import "package:flutter/material.dart";
import "package:flutter_form_builder/flutter_form_builder.dart";
import "package:form_builder_validators/form_builder_validators.dart";

class CustomTextfield extends StatelessWidget {

  const CustomTextfield(
      {super.key,
      required this.controller,
      required this.title,
      required this.validator,
      this.isObscure = false,
      this.isOnlyNumber = false});
  final TextEditingController controller;
  final String title;
  final List<FormFieldValidator<String>> validator;
  final bool isObscure;
  final bool isOnlyNumber;

  @override
  Widget build(BuildContext context) => Container(
      margin: const EdgeInsets.only(top: 10.0, left: 10.0, right: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(
                0xFF8992A3,
              ),
            ),
          ),
          FormBuilderTextField(
            name: title,
            obscureText: isObscure,
            keyboardType: isOnlyNumber ? TextInputType.number : null,
            validator: FormBuilderValidators.compose(
                validator),
            style: const TextStyle(
                color: Color.fromARGB(255, 106, 106, 106), fontSize: 15),
            controller: controller,
            decoration: InputDecoration(
              errorMaxLines: 2,
              contentPadding: const EdgeInsets.only(
                  left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
              hintText: title,
              hintStyle: const TextStyle(color: Colors.grey),
              filled: true,
              fillColor: const Color(
                0xFFF7F9FC,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  5.0,
                ),
                borderSide: const BorderSide(
                  color: Colors.transparent,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  5.0,
                ),
                borderSide: const BorderSide(
                  color: Colors.transparent,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  5.0,
                ),
                borderSide: const BorderSide(
                  color: Colors.transparent,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  5.0,
                ),
                borderSide: const BorderSide(
                  color: Colors.transparent,
                ),
              ),
            ),
          )
        ],
      ),
    );


}
