import '../account.dart';

class EmptyAccount extends Accounts {
  static String type = 'empty';
  String address;
  int balance;
  int counter;
  String privateKey;
  String secret;

  EmptyAccount({
    this.secret,
    this.privateKey,
    this.address,
    this.balance,
    this.counter,
  });

  EmptyAccount.fromJson(
      Map<String, dynamic> json, this.secret, this.privateKey) {
    address = json['address'];
    balance = 0;
    counter = json['counter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = type;
    data['address'] = this.address;
    data['balance'] = this.balance;
    data['counter'] = this.counter;
    return data;
  }

  @override
  String get getType => type;
}
