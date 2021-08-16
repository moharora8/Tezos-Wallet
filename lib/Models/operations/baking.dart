import '../operations.dart';

class BakingOperation extends Operation {
  static String type = 'baking';
  int id;
  int level;
  String timestamp;
  String block;
  Baker baker;
  int priority;
  int deposit;
  int reward;
  int fees;
  @override
  String get getType => type;

  BakingOperation(
      {this.id,
      this.level,
      this.timestamp,
      this.block,
      this.baker,
      this.priority,
      this.deposit,
      this.reward,
      this.fees});

  BakingOperation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    level = json['level'];
    timestamp = json['timestamp'];
    block = json['block'];
    baker = json['baker'] != null ? new Baker.fromJson(json['baker']) : null;
    priority = json['priority'];
    deposit = json['deposit'];
    reward = json['reward'];
    fees = json['fees'];
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
    data['priority'] = this.priority;
    data['deposit'] = this.deposit;
    data['reward'] = this.reward;
    data['fees'] = this.fees;
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
