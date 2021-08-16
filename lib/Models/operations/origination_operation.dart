import '../operations.dart';

class OriginationOperation extends Operation {
  static String type = 'origination';
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
  int contractBalance;
  Sender contractManager;
  Sender contractDelegate;
  String status;
  OriginatedContract originatedContract;
  @override
  String get getType => type;
  OriginationOperation(
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
      this.contractBalance,
      this.contractManager,
      this.contractDelegate,
      this.status,
      this.originatedContract});

  OriginationOperation.fromJson(Map<String, dynamic> json) {
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
    contractBalance = json['contractBalance'];
    contractManager = json['contractManager'] != null
        ? new Sender.fromJson(json['contractManager'])
        : null;
    contractDelegate = json['contractDelegate'] != null
        ? new Sender.fromJson(json['contractDelegate'])
        : null;
    status = json['status'];
    originatedContract = json['originatedContract'] != null
        ? new OriginatedContract.fromJson(json['originatedContract'])
        : null;
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
    data['contractBalance'] = this.contractBalance;
    if (this.contractManager != null) {
      data['contractManager'] = this.contractManager.toJson();
    }
    if (this.contractDelegate != null) {
      data['contractDelegate'] = this.contractDelegate.toJson();
    }
    data['status'] = this.status;
    if (this.originatedContract != null) {
      data['originatedContract'] = this.originatedContract.toJson();
    }
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

class OriginatedContract {
  String kind;
  String address;
  int typeHash;
  int codeHash;

  OriginatedContract({this.kind, this.address, this.typeHash, this.codeHash});

  OriginatedContract.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    address = json['address'];
    typeHash = json['typeHash'];
    codeHash = json['codeHash'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kind'] = this.kind;
    data['address'] = this.address;
    data['typeHash'] = this.typeHash;
    data['codeHash'] = this.codeHash;
    return data;
  }
}
