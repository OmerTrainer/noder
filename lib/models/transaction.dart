import 'package:flutter/cupertino.dart';

class Transaction {
  String? id;
  String title;
  double price;
  DateTime date;
  Transaction({
    this.id,
    required this.title,
    required this.price,
    required this.date,
  });
}
