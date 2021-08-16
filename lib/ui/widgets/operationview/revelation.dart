import 'package:flutter/material.dart';
import '../../../Models/operations/revelation_penalty.dart';

class RevelationView extends StatelessWidget {
  const RevelationView({Key key, this.operation}) : super(key: key);
  final RevelationPenaltyOperation operation;
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
              Text('Baker Address : ${operation.baker.address}',
                  style: Theme.of(context).textTheme.headline1),
              Text('Lost Reward: ${operation.lostReward}',
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
