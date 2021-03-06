import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deletetx;
  TransactionList(this.transactions, this.deletetx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Column(
            children: <Widget>[
              Text(
                'No transactions added yet!',
                // ignore: deprecated_member_use
                style: Theme.of(context).textTheme.title,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  )),
            ],
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                shadowColor: Colors.blue,
                elevation: 10,
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 40,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: FittedBox(
                          child: Text('\$${transactions[index].amount}')),
                    ),
                  ),
                  title: Text(
                    transactions[index].title,
                    // ignore: deprecated_member_use
                    style: Theme.of(context).textTheme.title,
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    color: Theme.of(context).errorColor,
                    onPressed: () => deletetx(transactions[index].id),
                  ),
                  subtitle: Text(
                    DateFormat.yMMMEd().format(transactions[index].date),
                  ),
                ),
              );
            },
            itemCount: transactions.length,
          );
  }
}
