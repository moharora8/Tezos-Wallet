import 'package:flutter/material.dart';
import '../../../Models/operations/nonce_revelation_operation.dart';

class NonceRevelationView extends StatelessWidget {
  const NonceRevelationView({Key key, this.operation}) : super(key: key);
  final NonceRevelationOperation operation;
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
              Text('Baker Reward : ${operation.bakerRewards}',
                  style: Theme.of(context).textTheme.headline1),
              Text('Sender: ${operation.sender}',
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
