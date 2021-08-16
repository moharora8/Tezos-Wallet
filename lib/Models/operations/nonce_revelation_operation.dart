import '../operations.dart';

class NonceRevelationOperation extends Operation {
  static String type = 'nonce_revelation';
  int id;
  int level;
  String timestamp;
  String block;
  String hash;
  Baker baker;
  int bakerRewards;
  Baker sender;
  int revealedLevel;
  @override
  String get getType => type;
  NonceRevelationOperation(
      {this.id,
      this.level,
      this.timestamp,
      this.block,
      this.hash,
      this.baker,
      this.bakerRewards,
      this.sender,
      this.revealedLevel});

  NonceRevelationOperation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    level = json['level'];
    timestamp = json['timestamp'];
    block = json['block'];
    hash = json['hash'];
    baker = json['baker'] != null ? new Baker.fromJson(json['baker']) : null;
    bakerRewards = json['bakerRewards'];
    sender = json['sender'] != null ? new Baker.fromJson(json['sender']) : null;
    revealedLevel = json['revealedLevel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = type;
    data['id'] = this.id;
    data['level'] = this.level;
    data['timestamp'] = this.timestamp;
    data['block'] = this.block;
    data['hash'] = this.hash;
    if (this.baker != null) {
      data['baker'] = this.baker.toJson();
    }
    data['bakerRewards'] = this.bakerRewards;
    if (this.sender != null) {
      data['sender'] = this.sender.toJson();
    }
    data['revealedLevel'] = this.revealedLevel;
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
