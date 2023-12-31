import 'package:flutter/material.dart';

class FormUserInput extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const FormUserInput({
    Key? key,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      autofocus: true,
      keyboardType: TextInputType.number,
      style: const TextStyle(),
      maxLength: 2,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: const EdgeInsets.all(20),
        hintStyle: TextStyle(
            color: Theme.of(context).bottomAppBarTheme.color, fontSize: 14),
        counterText: '',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}
