import '../operations.dart';

class RevealOperation extends Operation {
  static String type = 'reveal';
  int id;
  int level;
  String timestamp;
  String block;
  String hash;
  Sender sender;
  int counter;
  int gasLimit;
  int gasUsed;
  int bakerFee;
  String status;
  @override
  String get getType => type;
  RevealOperation(
      {this.id,
      this.level,
      this.timestamp,
      this.block,
      this.hash,
      this.sender,
      this.counter,
      this.gasLimit,
      this.gasUsed,
      this.bakerFee,
      this.status});

  RevealOperation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    level = json['level'];
    timestamp = json['timestamp'];
    block = json['block'];
    hash = json['hash'];
    sender =
        json['sender'] != null ? new Sender.fromJson(json['sender']) : null;
    counter = json['counter'];
    gasLimit = json['gasLimit'];
    gasUsed = json['gasUsed'];
    bakerFee = json['bakerFee'];
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
    if (this.sender != null) {
      data['sender'] = this.sender.toJson();
    }
    data['counter'] = this.counter;
    data['gasLimit'] = this.gasLimit;
    data['gasUsed'] = this.gasUsed;
    data['bakerFee'] = this.bakerFee;
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
