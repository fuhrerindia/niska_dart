import 'package:flutter/material.dart';
import 'package:niska/comp/header.dart';

class PlanLeave extends StatelessWidget {
  const PlanLeave({super.key});

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Padding(
      padding: EdgeInsets.only(top: statusBarHeight),
      child: Column(
        children: [
          Header(title: "Plan\nLeaves"),
          const Center(
            child: Text(
              "This feature is currently under development",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
