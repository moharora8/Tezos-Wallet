import 'package:flutter/material.dart';
import '../../../Models/operations/double_baking.dart';

class DoubleBakerView extends StatelessWidget {
  const DoubleBakerView({Key key, this.operation}) : super(key: key);
  final DoubleBakingOperation operation;
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
              Text('Acc user Rewards: ${operation.accuserRewards}',
                  style: Theme.of(context).textTheme.headline1),
              Text('Offender Lost Rewards: ${operation.offenderLostRewards}',
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
