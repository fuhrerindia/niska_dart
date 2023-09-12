import 'dart:async';
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
  int balance = 0;

  void doThis() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> data = await prefs.getStringList('data') ?? [];
    Timer(const Duration(milliseconds: 800), () {
      setState(() {
        _data_to_render = data;
      });
      balance = calculateBalance();
    });
  }

  int calculateBalance() {
    int balance = 0;
    for (String element in _data_to_render) {
      Map data = jsonDecode(element);
      int amount = data['amount'];
      String arth = data['type'];
      if (arth == 'credit') {
        balance = balance + amount;
      } else {
        balance = balance - amount;
      }
    }
    return balance;
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
                      return Column(
                        children: [
                          Header(title: "Past\nExpenses"),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 20),
                            child: Row(
                              children: [
                                Text(
                                  "₹$balance",
                                  style: const TextStyle(
                                    color: Colors.green,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      );
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
