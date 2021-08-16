import 'package:flutter/material.dart';
import '../../../Models/operations/transaction_operation.dart';

class TransactionView extends StatelessWidget {
  const TransactionView({Key key, this.operation}) : super(key: key);
  final TransactionOperation operation;
  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                  width: double.infinity,
                  color: Colors.grey[300],
                  padding: const EdgeInsets.all(8),
                  child: Center(
                    child: Text(operation.getType.toUpperCase(),
                        style: Theme.of(context).textTheme.headline4),
                  )),
              SizedBox(
                height: 10,
              ),
              Text('Amount : ${operation.amount} mutez',
                  style: Theme.of(context).textTheme.headline1),
              Text('Gas Used: ${operation.gasUsed}',
                  style: Theme.of(context).textTheme.headline1),
              Text('Sender: ${operation.sender.address}',
                  style: Theme.of(context).textTheme.headline1),
              Text('Target: ${operation.target.address}',
                  style: Theme.of(context).textTheme.headline1),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(operation.timestamp,
                      style: Theme.of(context).textTheme.headline4)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
