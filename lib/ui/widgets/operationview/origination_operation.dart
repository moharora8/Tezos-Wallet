import 'package:flutter/material.dart';
import '../../../Models/operations/origination_operation.dart';

class OriginationView extends StatelessWidget {
  const OriginationView({Key key, this.operation}) : super(key: key);
  final OriginationOperation operation;
  @override
  Widget build(BuildContext context) {
    return Padding(
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
              Text('Allocation fee : ${operation.allocationFee}',
                  style: Theme.of(context).textTheme.headline1),
              Text('Contract Balance : ${operation.contractBalance}',
                  style: Theme.of(context).textTheme.headline1),
              Text('Contract Manager : ${operation.contractManager}',
                  style: Theme.of(context).textTheme.headline1),
              Text('Gas Used : ${operation.gasUsed}',
                  style: Theme.of(context).textTheme.headline1),
              Text('Sender: ${operation.sender.address}',
                  style: Theme.of(context).textTheme.headline1),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(operation.timestamp,
                      style: Theme.of(context).textTheme.headline1)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
