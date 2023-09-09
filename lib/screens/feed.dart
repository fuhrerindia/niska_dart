import 'package:flutter/material.dart';
import '../comp/header.dart';
import '../comp/list_item.dart';

const data = [
  {'price': "2000", 'profit': false, 'info': 'Hello World'},
  {'price': "4000", 'profit': true, 'info': 'drret'},
];

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Header(title: "Past\nExpenses");
              } else {
                return ListItem(
                    price: '5,000', profit: false, info: "Hello orldxf");
              }
            },
          ),
        ),
      ],
    );
  }
}
