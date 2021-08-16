import 'package:flutter/material.dart';
import '../../../Models/operations/ballot.dart';

class BallotView extends StatelessWidget {
  const BallotView({Key key, this.operation}) : super(key: key);
  final BallotOperation operation;
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
              Text('Delegate Address: ${operation.delegate.address}',style: Theme.of(context).textTheme.headline1),
              Text('Proposal: ${operation.proposal.alias}',style: Theme.of(context).textTheme.headline1),
              Text('Vote: ${operation.vote}',style: Theme.of(context).textTheme.headline1),
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
