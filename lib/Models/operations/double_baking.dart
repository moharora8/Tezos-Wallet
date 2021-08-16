import '../operations.dart';

class DoubleBakingOperation extends Operation {
  static String type = 'double_baking';
  int id;
  int level;
  String timestamp;
  String block;
  String hash;
  int accusedLevel;
  Accuser accuser;
  int accuserRewards;
  Offender offender;
  int offenderLostDeposits;
  int offenderLostRewards;
  int offenderLostFees;
  @override
  String get getType => type;
  DoubleBakingOperation(
      {this.id,
      this.level,
      this.timestamp,
      this.block,
      this.hash,
      this.accusedLevel,
      this.accuser,
      this.accuserRewards,
      this.offender,
      this.offenderLostDeposits,
      this.offenderLostRewards,
      this.offenderLostFees});

  DoubleBakingOperation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    level = json['level'];
    timestamp = json['timestamp'];
    block = json['block'];
    hash = json['hash'];
    accusedLevel = json['accusedLevel'];
    accuser =
        json['accuser'] != null ? new Accuser.fromJson(json['accuser']) : null;
    accuserRewards = json['accuserRewards'];
    offender = json['offender'] != null
        ? new Offender.fromJson(json['offender'])
        : null;
    offenderLostDeposits = json['offenderLostDeposits'];
    offenderLostRewards = json['offenderLostRewards'];
    offenderLostFees = json['offenderLostFees'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = type;
    data['id'] = this.id;
    data['level'] = this.level;
    data['timestamp'] = this.timestamp;
    data['block'] = this.block;
    data['hash'] = this.hash;
    data['accusedLevel'] = this.accusedLevel;
    if (this.accuser != null) {
      data['accuser'] = this.accuser.toJson();
    }
    data['accuserRewards'] = this.accuserRewards;
    if (this.offender != null) {
      data['offender'] = this.offender.toJson();
    }
    data['offenderLostDeposits'] = this.offenderLostDeposits;
    data['offenderLostRewards'] = this.offenderLostRewards;
    data['offenderLostFees'] = this.offenderLostFees;
    return data;
  }
}

class Accuser {
  String alias;
  String address;

  Accuser({this.alias, this.address});

  Accuser.fromJson(Map<String, dynamic> json) {
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

class Offender {
  String address;

  Offender({this.address});

  Offender.fromJson(Map<String, dynamic> json) {
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    return data;
  }
}
