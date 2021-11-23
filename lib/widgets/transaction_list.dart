//ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:noder/models/transaction.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTrans;
  const TransactionList(this.transactions, this.deleteTrans);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: transactions.isEmpty
          ? LayoutBuilder(builder: (ctx, constraints) {
              return Column(
                children: <Widget>[
                  Text(
                    'No Transactions made',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              );
            })
          : ListView(
              children: transactions
                  .map(
                    (tx) => TransactionItem(
                        key: ValueKey(tx.id),
                        transaction: tx,
                        deleteTrans: deleteTrans),
                  )
                  .toList(),
            ),
    );
  }
}
