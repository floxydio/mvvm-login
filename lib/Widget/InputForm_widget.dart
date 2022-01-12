// ignore_for_file: file_names

import 'package:flutter/material.dart';

class InputForm extends StatelessWidget {
  final TextEditingController textEditingController;
  final String? label;
  final bool isPassword;
  const InputForm(
      {Key? key,
      required this.textEditingController,
      required this.label,
      this.isPassword = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword,
      controller: textEditingController,
      validator: (value) {
        value!.isEmpty ? "This field is Required" : "";
      },
      decoration:
          InputDecoration(border: const OutlineInputBorder(), labelText: label),
    );
  }
}
