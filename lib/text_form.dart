import 'package:flutter/material.dart';

class textFormWidget extends StatelessWidget {
  textFormWidget({Key? key, required this.controller, required this.labelText})
      : super(key: key);

  final TextEditingController controller;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        labelText: labelText,
      ),
    );
  }
}
