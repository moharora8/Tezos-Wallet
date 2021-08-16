import '../operations.dart';

class RevelationPenaltyOperation extends Operation {
  static String type = 'revelation_penalty';
  int id;
  int level;
  String timestamp;
  String block;
  Baker baker;
  int missedLevel;
  int lostReward;
  int lostFees;
  @override
  String get getType => type;
  RevelationPenaltyOperation(
      {this.id,
      this.level,
      this.timestamp,
      this.block,
      this.baker,
      this.missedLevel,
      this.lostReward,
      this.lostFees});

  RevelationPenaltyOperation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    level = json['level'];
    timestamp = json['timestamp'];
    block = json['block'];
    baker = json['baker'] != null ? new Baker.fromJson(json['baker']) : null;
    missedLevel = json['missedLevel'];
    lostReward = json['lostReward'];
    lostFees = json['lostFees'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = type;
    data['id'] = this.id;
    data['level'] = this.level;
    data['timestamp'] = this.timestamp;
    data['block'] = this.block;
    if (this.baker != null) {
      data['baker'] = this.baker.toJson();
    }
    data['missedLevel'] = this.missedLevel;
    data['lostReward'] = this.lostReward;
    data['lostFees'] = this.lostFees;
    return data;
  }
}

class Baker {
  String alias;
  String address;

  Baker({this.alias, this.address});

  Baker.fromJson(Map<String, dynamic> json) {
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
