import 'dart:convert';

import 'package:flutter/material.dart';
import '../comp/header.dart';
import '../comp/list_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  List _data_to_render = [];

  void doThis() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> data = await prefs.getStringList('data') ?? [];
    setState(() {
      _data_to_render = data;
    });
  }

  @override
  void initState() {
    doThis();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: _data_to_render.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.teal,
                  ),
                )
              : ListView.builder(
                  itemCount: _data_to_render.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return Header(title: "Past\nExpenses");
                    } else {
                      int index_ = index - 1;
                      Map record = jsonDecode(_data_to_render[index_]);
                      int priceAmount = record['amount'];
                      return ListItem(
                          price: "$priceAmount",
                          profit: record['type'] == 'credit' ? true : false,
                          info: record['remark']);
                    }
                  },
                ),
        ),
      ],
    );
  }
}
