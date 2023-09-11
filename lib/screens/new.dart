import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:niska/comp/header.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewRecord extends StatefulWidget {
  const NewRecord({super.key});

  @override
  State<NewRecord> createState() => _NewRecordState();
}

class _NewRecordState extends State<NewRecord> {
  String currentRadioValue = 'credit';
  String group_name = '';
  String remark = "";
  int amount = 0;

  void saveData(String key, value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(key, value);
  }

  void _saveRecord() async {
    if (amount == 0) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Info'),
              content:
                  const Text('Transaction Record could not be saved for INR 0'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text("Okay"),
                ),
              ],
            );
          });
    } else {
      Map record_ = {
        'amount': amount,
        'remark': remark,
        'group': group_name,
        'type': currentRadioValue,
      };
      String record = jsonEncode(record_);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final List<String>? items = prefs.getStringList('data');
      List<String> data = items ?? [];
      data.insert(0, record);
      saveData('data', data);
      // ignore: use_build_context_synchronously
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Info'),
              content: const Text('Record is saved'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text("Okay"),
                ),
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        child: Column(
          children: [
            Header(title: "New\nExpense"),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: TextField(
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        onChanged: (value) {
                          setState(() {
                            if (int.tryParse(value) != null) {
                              amount = int.parse(value);
                            } else {
                              amount = 0;
                            }
                          });
                        },
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: 'Transaction Amount',
                          filled: false,
                          border: InputBorder.none,
                          fillColor: Colors.white,
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Radio(
                                value: 'credit',
                                groupValue: currentRadioValue,
                                fillColor: const MaterialStatePropertyAll(
                                    Colors.white),
                                onChanged: (value) {
                                  setState(() {
                                    currentRadioValue = value!;
                                  });
                                },
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    currentRadioValue = 'credit';
                                  });
                                },
                                child: const Text(
                                  "Credit",
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                value: 'debit',
                                groupValue: currentRadioValue,
                                fillColor: const MaterialStatePropertyAll(
                                    Colors.white),
                                activeColor: Colors.white,
                                onChanged: (value) {
                                  setState(() {
                                    currentRadioValue = value!;
                                  });
                                },
                              ),
                              InkWell(
                                onTap: () => setState(() {
                                  currentRadioValue = 'debit';
                                }),
                                child: const Text(
                                  "Debit",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            remark = value;
                          });
                        },
                        maxLines: 5,
                        decoration: const InputDecoration(
                          hintText: 'Transaction Remark',
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Use Enter to create new item",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            group_name = value;
                          });
                        },
                        decoration: const InputDecoration(
                          hintText: 'Group',
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: ElevatedButton(
                        onPressed: _saveRecord,
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            Color.fromARGB(255, 0, 98, 88),
                          ),
                        ),
                        child: const Text(
                          "Save Transaction",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: TextButton(
                        onPressed: null,
                        child: Text(
                          "Dismiss",
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
