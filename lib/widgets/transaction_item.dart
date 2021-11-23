import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:noder/models/transaction.dart';
//ignore_for_file: prefer_const_constructors

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key? key,
    required this.transaction,
    required this.deleteTrans,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTrans;

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color? _bgColor;

  final avilableColors = [
    Colors.red,
    Colors.yellow,
    Colors.blue,
    Colors.purple,
  ];

  @override
  void initState() {
    print(Random().nextInt(4));
    _bgColor = avilableColors[Random().nextInt(4)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: _bgColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Text(
                  '\$${widget.transaction.price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.transaction.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    DateFormat().format(widget.transaction.date),
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ],
          ),
          Container(
            width: 50,
            child: IconButton(
                onPressed: () => widget.deleteTrans(widget.transaction.id),
                icon: const Icon(Icons.highlight_remove_sharp)),
          ),
        ],
      ),
    );
  }
}
