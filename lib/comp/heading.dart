import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  String title = "";
  Heading({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 28,
      ),
    );
  }
}
