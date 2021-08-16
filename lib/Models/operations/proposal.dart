import '../operations.dart';

class ProposalOperation extends Operation {
  static String type = 'proposal';
  int id;
  int level;
  String timestamp;
  String block;
  String hash;
  Period period;
  Proposal proposal;
  Delegate delegate;
  int rolls;
  bool duplicated;
  @override
  String get getType => type;
  ProposalOperation(
      {this.id,
      this.level,
      this.timestamp,
      this.block,
      this.hash,
      this.period,
      this.proposal,
      this.delegate,
      this.rolls,
      this.duplicated});

  ProposalOperation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    level = json['level'];
    timestamp = json['timestamp'];
    block = json['block'];
    hash = json['hash'];
    period =
        json['period'] != null ? new Period.fromJson(json['period']) : null;
    proposal = json['proposal'] != null
        ? new Proposal.fromJson(json['proposal'])
        : null;
    delegate = json['delegate'] != null
        ? new Delegate.fromJson(json['delegate'])
        : null;
    rolls = json['rolls'];
    duplicated = json['duplicated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = type;
    data['id'] = this.id;
    data['level'] = this.level;
    data['timestamp'] = this.timestamp;
    data['block'] = this.block;
    data['hash'] = this.hash;
    if (this.period != null) {
      data['period'] = this.period.toJson();
    }
    if (this.proposal != null) {
      data['proposal'] = this.proposal.toJson();
    }
    if (this.delegate != null) {
      data['delegate'] = this.delegate.toJson();
    }
    data['rolls'] = this.rolls;
    data['duplicated'] = this.duplicated;
    return data;
  }
}

class Period {
  int index;
  int epoch;
  String kind;
  int firstLevel;
  int lastLevel;
  int id;
  int startLevel;
  int endLevel;

  Period(
      {this.index,
      this.epoch,
      this.kind,
      this.firstLevel,
      this.lastLevel,
      this.id,
      this.startLevel,
      this.endLevel});

  Period.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    epoch = json['epoch'];
    kind = json['kind'];
    firstLevel = json['firstLevel'];
    lastLevel = json['lastLevel'];
    id = json['id'];
    startLevel = json['startLevel'];
    endLevel = json['endLevel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['index'] = this.index;
    data['epoch'] = this.epoch;
    data['kind'] = this.kind;
    data['firstLevel'] = this.firstLevel;
    data['lastLevel'] = this.lastLevel;
    data['id'] = this.id;
    data['startLevel'] = this.startLevel;
    data['endLevel'] = this.endLevel;
    return data;
  }
}

class Proposal {
  String alias;
  String hash;

  Proposal({this.alias, this.hash});

  Proposal.fromJson(Map<String, dynamic> json) {
    alias = json['alias'];
    hash = json['hash'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['alias'] = this.alias;
    data['hash'] = this.hash;
    return data;
  }
}

class Delegate {
  String address;

  Delegate({this.address});

  Delegate.fromJson(Map<String, dynamic> json) {
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    return data;
  }
}
