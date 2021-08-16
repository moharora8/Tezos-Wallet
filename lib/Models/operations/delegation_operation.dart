import '../operations.dart';

class DelegationOperation extends Operation {
  static String type = 'delegation';
  int id;
  int level;
  String timestamp;
  String block;
  String hash;
  int counter;
  Sender sender;
  int gasLimit;
  int gasUsed;
  int bakerFee;
  int amount;
  Sender newDelegate;
  String status;
  @override
  String get getType => type;

  DelegationOperation(
      {this.id,
      this.level,
      this.timestamp,
      this.block,
      this.hash,
      this.counter,
      this.sender,
      this.gasLimit,
      this.gasUsed,
      this.bakerFee,
      this.amount,
      this.newDelegate,
      this.status});

  DelegationOperation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    level = json['level'];
    timestamp = json['timestamp'];
    block = json['block'];
    hash = json['hash'];
    counter = json['counter'];
    sender =
        json['sender'] != null ? new Sender.fromJson(json['sender']) : null;
    gasLimit = json['gasLimit'];
    gasUsed = json['gasUsed'];
    bakerFee = json['bakerFee'];
    amount = json['amount'];
    newDelegate = json['newDelegate'] != null
        ? new Sender.fromJson(json['newDelegate'])
        : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = type;
    data['id'] = this.id;
    data['level'] = this.level;
    data['timestamp'] = this.timestamp;
    data['block'] = this.block;
    data['hash'] = this.hash;
    data['counter'] = this.counter;
    if (this.sender != null) {
      data['sender'] = this.sender.toJson();
    }
    data['gasLimit'] = this.gasLimit;
    data['gasUsed'] = this.gasUsed;
    data['bakerFee'] = this.bakerFee;
    data['amount'] = this.amount;
    if (this.newDelegate != null) {
      data['newDelegate'] = this.newDelegate.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Sender {
  String address;

  Sender({this.address});

  Sender.fromJson(Map<String, dynamic> json) {
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    return data;
  }
}
