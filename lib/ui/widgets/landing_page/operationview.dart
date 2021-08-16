import 'package:flutter/material.dart';
import '../../../Models/accounts/delegate.dart';
import '../../../Models/operations.dart';
import '../../../Models/operations/activation.dart';
import '../../../Models/operations/baking.dart';
import '../../../Models/operations/ballot.dart';
import '../../../Models/operations/double_baking.dart';
import '../../../Models/operations/endorsements.dart';
import '../../../Models/operations/nonce_revelation_operation.dart';
import '../../../Models/operations/origination_operation.dart';
import '../../../Models/operations/proposal.dart';
import '../../../Models/operations/reveal_operation.dart';
import '../../../Models/operations/revelation_penalty.dart';
import '../../../Models/operations/transaction_operation.dart';
import '../../../state_management/appstate.dart';
import '../../widgets/operationview/activation_operation_view.dart';
import '../../widgets/operationview/baking_operation.dart';
import '../../widgets/operationview/ballotview.dart';
import '../../widgets/operationview/delegation_view.dart';
import '../../widgets/operationview/double_baker.dart';
import '../../widgets/operationview/endorsements.dart';
import '../../widgets/operationview/nonce_revalation.dart';
import '../../widgets/operationview/origination_operation.dart';
import '../../widgets/operationview/proposal.dart';
import '../../widgets/operationview/reveal_operation.dart';
import '../../widgets/operationview/revelation.dart';
import '../../widgets/operationview/transaction_opration.dart';

class OperationsView extends StatelessWidget {
  const OperationsView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (AppState.instance.getSelectedAccountOperations().isEmpty) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
        child: Text('No transactions yet!'),
      );
    }
    return Padding(
      padding: EdgeInsets.only(bottom: 20.0),
      child: Column(
        children: [
          for (var operation
              in AppState.instance.getSelectedAccountOperations())
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: getView(operation),
            )
        ],
      ),
    );
  }

  Widget getView(Operation o) {
    if (o.getType == ActivationOperation.type) {
      return ActivationOperationView(
        operation: o,
      );
    }
    if (o.getType == BakingOperation.type) {
      return BakingView(
        operation: o,
      );
    }

    if (o.getType == BallotOperation.type) return BallotView(operation: o);

    if (o.getType == DelegateAccount.type) {
      return DelegationView(
        operation: o,
      );
    }

    if (o.getType == DoubleBakingOperation.type) {
      return DoubleBakerView(
        operation: o,
      );
    }

    if (o.getType == EndorsementOperation.type) {
      return EndorsementsView(
        operation: o,
      );
    }

    if (o.getType == NonceRevelationOperation.type) {
      return NonceRevelationView(
        operation: o,
      );
    }
    if (o.getType == OriginationOperation.type) {
      return OriginationView(
        operation: o,
      );
    }
    if (o.getType == ProposalOperation.type) {
      return ProposalView(
        operation: o,
      );
    }

    if (o.getType == RevealOperation.type) {
      return RevealView(
        operation: o,
      );
    }
    if (o.getType == RevelationPenaltyOperation.type) {
      return RevelationView(operation: o);
    }
    if (o.getType == TransactionOperation.type) {
      return TransactionView(
        operation: o,
      );
    }
  }
}
