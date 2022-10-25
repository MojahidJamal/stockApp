import 'package:flutter/material.dart';

class sendFunc extends StatelessWidget {
  sendFunc(
      {Key? key,
      required this.name,
      required this.size,
      required this.quantity,
      required this.price})
      : super(key: key);

  String name;
  String size;
  String quantity;
  String price;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(name),
      ],
    );
  }
}
