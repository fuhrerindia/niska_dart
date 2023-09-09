import 'package:flutter/material.dart';
import './heading.dart';

class Header extends StatelessWidget {
  String title;
  Header({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [Color(0xff0097A9), Color(0xff00545E)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 20, 20),
          child: Row(
            children: [
              const Icon(
                Icons.account_balance_wallet,
                color: Colors.white,
                size: 75,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Heading(title: title),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
