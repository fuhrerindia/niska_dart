import 'package:flutter/material.dart';
import 'package:niska/comp/header.dart';

class NewRecord extends StatefulWidget {
  const NewRecord({super.key});

  @override
  State<NewRecord> createState() => _NewRecordState();
}

class _NewRecordState extends State<NewRecord> {
  String currentRadioValue = 'credit';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Header(title: "New\nExpense"),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: const TextField(
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
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
                              fillColor:
                                  const MaterialStatePropertyAll(Colors.white),
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
                              fillColor:
                                  const MaterialStatePropertyAll(Colors.white),
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
                    child: const TextField(
                      maxLines: 8,
                      decoration: InputDecoration(
                        hintText: 'Transaction Remark',
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: ElevatedButton(
                      onPressed: null,
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 0, 98, 88),
                        ),
                      ),
                      child: Text(
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
        ),
      ],
    );
  }
}
