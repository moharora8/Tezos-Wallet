import 'dart:convert';

import '../Models/accounts/contract.dart';
import '../Models/accounts/delegate.dart';
import '../Models/accounts/empty.dart';
import '../Models/accounts/user.dart';

abstract class Accounts {
  String get getType;
}

Accounts accountFromJsonString(String s, String pr, String se) {
  Map<String, dynamic> json = jsonDecode(s);
  if (json['type'] == ContractAccount.type) {
    return ContractAccount.fromJson(json, se, pr);
  }

  if (json['type'] == DelegateAccount.type) {
    return DelegateAccount.fromJson(json, se, pr);
  }

  if (json['type'] == UserAccount.type) {
    return DelegateAccount.fromJson(json, se, pr);
  }
  if (json['type'] == EmptyAccount.type) {
    return EmptyAccount.fromJson(json, se, pr);
  }

  return null;
}
