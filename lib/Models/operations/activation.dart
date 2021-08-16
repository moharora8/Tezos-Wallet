import '../operations.dart';

class ActivationOperation extends Operation {
  static String type = 'activation';
  int id;
  int level;
  String timestamp;
  String block;
  String hash;
  Account account;
  int balance;

  ActivationOperation(
      {this.id,
      this.level,
      this.timestamp,
      this.block,
      this.hash,
      this.account,
      this.balance});

  ActivationOperation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    level = json['level'];
    timestamp = json['timestamp'];
    block = json['block'];
    hash = json['hash'];
    account =
        json['account'] != null ? new Account.fromJson(json['account']) : null;
    balance = json['balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = type;
    data['id'] = this.id;
    data['level'] = this.level;
    data['timestamp'] = this.timestamp;
    data['block'] = this.block;
    data['hash'] = this.hash;
    if (this.account != null) {
      data['account'] = this.account.toJson();
    }
    data['balance'] = this.balance;
    return data;
  }

  @override
  String get getType => type;
}

class Account {
  String address;

  Account({this.address});

  Account.fromJson(Map<String, dynamic> json) {
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    return data;
  }
}
