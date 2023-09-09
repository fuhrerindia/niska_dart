import 'package:flutter/material.dart';

class ListItem extends StatefulWidget {
  String price = "";
  bool profit = false;
  String info = "";
  ListItem(
      {super.key,
      required this.price,
      required this.profit,
      required this.info});
  @override
  State createState() {
    return _ListItem();
  }
}

class _ListItem extends State<ListItem> {
  bool showInfo = false;
  void toggleInfo() {
    setState(() {
      showInfo = !showInfo;
    });
  }

  @override
  Widget build(BuildContext context) {
    String sign = widget.profit ? "+" : "-";
    String price = widget.price;
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        decoration: BoxDecoration(
          color: Color(0xff282828),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white,
            width: 1,
          ),
        ),
        child: InkWell(
          onTap: toggleInfo,
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.account_balance_wallet,
                    color: widget.profit == true ? Colors.green : Colors.red,
                    size: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "$sign₹$price",
                      style: TextStyle(
                        color: widget.profit ? Colors.green : Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xff525252),
                    ),
                    child: Icon(
                      showInfo
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              if (showInfo == true)
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      'sdfsdfs',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
