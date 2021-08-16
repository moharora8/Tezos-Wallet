import '../operations.dart';

class TransactionOperation extends Operation {
  static String type = 'transaction';
  int id;
  int level;
  String timestamp;
  String block;
  String hash;
  int counter;
  Sender sender;
  int gasLimit;
  int gasUsed;
  int storageLimit;
  int storageUsed;
  int bakerFee;
  int storageFee;
  int allocationFee;
  Target target;
  int amount;
  Parameter parameter;
  String status;
  bool hasInternals;
  String parameters;
  @override
  String get getType => type;
  TransactionOperation(
      {this.id,
      this.level,
      this.timestamp,
      this.block,
      this.hash,
      this.counter,
      this.sender,
      this.gasLimit,
      this.gasUsed,
      this.storageLimit,
      this.storageUsed,
      this.bakerFee,
      this.storageFee,
      this.allocationFee,
      this.target,
      this.amount,
      this.parameter,
      this.status,
      this.hasInternals,
      this.parameters});

  TransactionOperation.fromJson(Map<String, dynamic> json) {
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
    storageLimit = json['storageLimit'];
    storageUsed = json['storageUsed'];
    bakerFee = json['bakerFee'];
    storageFee = json['storageFee'];
    allocationFee = json['allocationFee'];
    target =
        json['target'] != null ? new Target.fromJson(json['target']) : null;
    amount = json['amount'];
    parameter = json['parameter'] != null
        ? new Parameter.fromJson(json['parameter'])
        : null;
    status = json['status'];
    hasInternals = json['hasInternals'];
    parameters = json['parameters'];
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
    data['storageLimit'] = this.storageLimit;
    data['storageUsed'] = this.storageUsed;
    data['bakerFee'] = this.bakerFee;
    data['storageFee'] = this.storageFee;
    data['allocationFee'] = this.allocationFee;
    if (this.target != null) {
      data['target'] = this.target.toJson();
    }
    data['amount'] = this.amount;
    if (this.parameter != null) {
      data['parameter'] = this.parameter.toJson();
    }
    data['status'] = this.status;
    data['hasInternals'] = this.hasInternals;
    data['parameters'] = this.parameters;
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

class Target {
  String alias;
  String address;

  Target({this.alias, this.address});

  Target.fromJson(Map<String, dynamic> json) {
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

class Parameter {
  String entrypoint;
  Value value;

  Parameter({this.entrypoint, this.value});

  Parameter.fromJson(Map<String, dynamic> json) {
    entrypoint = json['entrypoint'];
    value = json['value'] != null ? new Value.fromJson(json['value']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['entrypoint'] = this.entrypoint;
    if (this.value != null) {
      data['value'] = this.value.toJson();
    }
    return data;
  }
}

class Value {
  Null r;

  Value({this.r});

  Value.fromJson(Map<String, dynamic> json) {
    r = json['R'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['R'] = this.r;
    return data;
  }
}
