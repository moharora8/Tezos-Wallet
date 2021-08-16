import 'dart:convert';

import '../Models/operations/activation.dart';
import '../Models/operations/baking.dart';
import '../Models/operations/ballot.dart';
import '../Models/operations/delegation_operation.dart';
import '../Models/operations/double_baking.dart';
import '../Models/operations/endorsements.dart';
import '../Models/operations/nonce_revelation_operation.dart';
import '../Models/operations/origination_operation.dart';
import '../Models/operations/proposal.dart';
import '../Models/operations/reveal_operation.dart';
import '../Models/operations/transaction_operation.dart';

abstract class Operation {
  Map<String, dynamic> toJson();
  String get getType;
}

Operation operationFromJsonString(Map<String, dynamic> json) {
  if (json['type'] == ActivationOperation.type) {
    return ActivationOperation.fromJson(json);
  }

  if (json['type'] == BakingOperation.type) {
    return BakingOperation.fromJson(json);
  }

  if (json['type'] == BallotOperation.type) {
    return BallotOperation.fromJson(json);
  }

  if (json['type'] == DelegationOperation.type) {
    return DelegationOperation.fromJson(json);
  }

  if (json['type'] == DoubleBakingOperation.type) {
    return DoubleBakingOperation.fromJson(json);
  }

  if (json['type'] == EndorsementOperation.type) {
    return EndorsementOperation.fromJson(json);
  }

  if (json['type'] == NonceRevelationOperation.type) {
    return NonceRevelationOperation.fromJson(json);
  }

  if (json['type'] == OriginationOperation.type) {
    return OriginationOperation.fromJson(json);
  }

  if (json['type'] == ProposalOperation.type) {
    return ProposalOperation.fromJson(json);
  }

  if (json['type'] == RevealOperation.type) {
    return RevealOperation.fromJson(json);
  }

  if (json['type'] == RevealOperation.type) {
    return RevealOperation.fromJson(json);
  }

  if (json['type'] == TransactionOperation.type) {
    return TransactionOperation.fromJson(json);
  }

  return null;
}
