//ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTrans;

  NewTransaction(this.addTrans);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime? selectedDate;

  void sumbitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty ||
        enteredAmount <= 0 ||
        enteredAmount >= 10000 ||
        selectedDate == null) {
      return;
    }
    widget.addTrans(
      titleController.text,
      double.parse(amountController.text),
      selectedDate,
    );
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Title',
                  labelStyle: TextStyle(fontSize: 15),
                ),
                controller: titleController,
                keyboardType: TextInputType.text,
                onSubmitted: (_) => sumbitData(),
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Amount',
                  labelStyle: TextStyle(fontSize: 15),
                ),
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => sumbitData(),
              ),
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                          selectedDate == null
                              ? 'No Date Chosen!'
                              : 'picked date: ${(DateFormat.yMd().format(selectedDate!))}',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    FlatButton(
                      onPressed: _presentDatePicker,
                      child: const Text(
                        'Choose date',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      textColor: Theme.of(context).primaryColor,
                    )
                  ],
                ),
              ),
              RaisedButton(
                onPressed: sumbitData,
                child: const Text(
                  'Add Transaction',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                color: Theme.of(context).primaryColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
