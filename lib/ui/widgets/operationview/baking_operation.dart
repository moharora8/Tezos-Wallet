import 'package:flutter/material.dart';
import '../../../Models/operations/activation.dart';
import '../../../Models/operations/baking.dart';

class BakingView extends StatelessWidget {
  const BakingView({Key key, this.operation}) : super(key: key);
  final BakingOperation operation;
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
                    child: Text(
                      operation.getType.toUpperCase(),style: Theme.of(context).textTheme.headline4
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              Text('Baker Address: ${operation.baker.address}',style: Theme.of(context).textTheme.headline1),
              Text('Deposit: ${operation.deposit}',style: Theme.of(context).textTheme.headline1),
              Text('Fee: ${operation.fees}',style: Theme.of(context).textTheme.headline1),
              Text('Reward: ${operation.reward}',style: Theme.of(context).textTheme.headline1),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [Text(operation.timestamp,style: Theme.of(context).textTheme.headline1)],
              )
            ],
          ),
        ),
      ),
    );
  }
}
