import '../operations.dart';

class EndorsementOperation extends Operation {
  static String type = 'endorsement';
  int id;
  int level;
  String timestamp;
  String block;
  String hash;
  Delegate delegate;
  int slots;
  int deposit;
  int rewards;
  @override
  String get getType => type;
  EndorsementOperation(
      {this.id,
      this.level,
      this.timestamp,
      this.block,
      this.hash,
      this.delegate,
      this.slots,
      this.deposit,
      this.rewards});

  EndorsementOperation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    level = json['level'];
    timestamp = json['timestamp'];
    block = json['block'];
    hash = json['hash'];
    delegate = json['delegate'] != null
        ? new Delegate.fromJson(json['delegate'])
        : null;
    slots = json['slots'];
    deposit = json['deposit'];
    rewards = json['rewards'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = type;
    data['id'] = this.id;
    data['level'] = this.level;
    data['timestamp'] = this.timestamp;
    data['block'] = this.block;
    data['hash'] = this.hash;
    if (this.delegate != null) {
      data['delegate'] = this.delegate.toJson();
    }
    data['slots'] = this.slots;
    data['deposit'] = this.deposit;
    data['rewards'] = this.rewards;
    return data;
  }
}

class Delegate {
  String alias;
  String address;

  Delegate({this.alias, this.address});

  Delegate.fromJson(Map<String, dynamic> json) {
    alias = json['alias'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['alias'] = this.alias;
    data['address'] = this.address;
    return data;
  }
}
