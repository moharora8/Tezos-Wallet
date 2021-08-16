import '../account.dart';
import '../accounts/metadata.dart';
import '../operations.dart';

class DelegateAccount extends Accounts {
  static String type = 'delegate';
  bool active;
  String alias;
  String address;
  String publicKey;
  bool revealed;
  String privateKey;
  String secret;
  int balance;
  int frozenDeposits;
  int frozenRewards;
  int frozenFees;
  int counter;
  int activationLevel;
  String activationTime;
  int deactivationLevel;
  String deactivationTime;
  int stakingBalance;
  int numContracts;
  int numDelegators;
  int numBlocks;
  int numEndorsements;
  int numBallots;
  int numProposals;
  int numActivations;
  int numDoubleBaking;
  int numDoubleEndorsing;
  int numNonceRevelations;
  int numRevelationPenalties;
  int numDelegations;
  int numOriginations;
  int numTransactions;
  int numReveals;
  int numMigrations;
  int firstActivity;
  String firstActivityTime;
  int lastActivity;
  String lastActivityTime;
  List<Contracts> contracts;
  List<Delegators> delegators;
  List<Operation> operations = [];
  Metadata metadata;
  Software software;

  DelegateAccount(
      {this.secret,
      this.privateKey,
      this.active,
      this.alias,
      this.address,
      this.publicKey,
      this.revealed,
      this.balance,
      this.frozenDeposits,
      this.frozenRewards,
      this.frozenFees,
      this.counter,
      this.activationLevel,
      this.activationTime,
      this.deactivationLevel,
      this.deactivationTime,
      this.stakingBalance,
      this.numContracts,
      this.numDelegators,
      this.numBlocks,
      this.numEndorsements,
      this.numBallots,
      this.numProposals,
      this.numActivations,
      this.numDoubleBaking,
      this.numDoubleEndorsing,
      this.numNonceRevelations,
      this.numRevelationPenalties,
      this.numDelegations,
      this.numOriginations,
      this.numTransactions,
      this.numReveals,
      this.numMigrations,
      this.firstActivity,
      this.firstActivityTime,
      this.lastActivity,
      this.lastActivityTime,
      this.contracts,
      this.delegators,
      this.operations,
      this.metadata,
      this.software});

  DelegateAccount.fromJson(
      Map<String, dynamic> json, this.secret, this.privateKey) {
    active = json['active'];
    alias = json['alias'];
    address = json['address'];
    publicKey = json['publicKey'];
    revealed = json['revealed'];
    balance = json['balance'];
    frozenDeposits = json['frozenDeposits'];
    frozenRewards = json['frozenRewards'];
    frozenFees = json['frozenFees'];
    counter = json['counter'];
    activationLevel = json['activationLevel'];
    activationTime = json['activationTime'];
    deactivationLevel = json['deactivationLevel'];
    deactivationTime = json['deactivationTime'];
    stakingBalance = json['stakingBalance'];
    numContracts = json['numContracts'];
    numDelegators = json['numDelegators'];
    numBlocks = json['numBlocks'];
    numEndorsements = json['numEndorsements'];
    numBallots = json['numBallots'];
    numProposals = json['numProposals'];
    numActivations = json['numActivations'];
    numDoubleBaking = json['numDoubleBaking'];
    numDoubleEndorsing = json['numDoubleEndorsing'];
    numNonceRevelations = json['numNonceRevelations'];
    numRevelationPenalties = json['numRevelationPenalties'];
    numDelegations = json['numDelegations'];
    numOriginations = json['numOriginations'];
    numTransactions = json['numTransactions'];
    numReveals = json['numReveals'];
    numMigrations = json['numMigrations'];
    firstActivity = json['firstActivity'];
    firstActivityTime = json['firstActivityTime'];
    lastActivity = json['lastActivity'];
    lastActivityTime = json['lastActivityTime'];
    if (json['contracts'] != null) {
      contracts = new List<Contracts>();
      json['contracts'].forEach((v) {
        contracts.add(new Contracts.fromJson(v));
      });
    }
    if (json['delegators'] != null) {
      delegators = new List<Delegators>();
      json['delegators'].forEach((v) {
        delegators.add(new Delegators.fromJson(v));
      });
    }
    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    software = json['software'] != null
        ? new Software.fromJson(json['software'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['active'] = this.active;
    data['alias'] = this.alias;
    data['address'] = this.address;
    data['publicKey'] = this.publicKey;
    data['revealed'] = this.revealed;
    data['balance'] = this.balance;
    data['frozenDeposits'] = this.frozenDeposits;
    data['frozenRewards'] = this.frozenRewards;
    data['frozenFees'] = this.frozenFees;
    data['counter'] = this.counter;
    data['activationLevel'] = this.activationLevel;
    data['activationTime'] = this.activationTime;
    data['deactivationLevel'] = this.deactivationLevel;
    data['deactivationTime'] = this.deactivationTime;
    data['stakingBalance'] = this.stakingBalance;
    data['numContracts'] = this.numContracts;
    data['numDelegators'] = this.numDelegators;
    data['numBlocks'] = this.numBlocks;
    data['numEndorsements'] = this.numEndorsements;
    data['numBallots'] = this.numBallots;
    data['numProposals'] = this.numProposals;
    data['numActivations'] = this.numActivations;
    data['numDoubleBaking'] = this.numDoubleBaking;
    data['numDoubleEndorsing'] = this.numDoubleEndorsing;
    data['numNonceRevelations'] = this.numNonceRevelations;
    data['numRevelationPenalties'] = this.numRevelationPenalties;
    data['numDelegations'] = this.numDelegations;
    data['numOriginations'] = this.numOriginations;
    data['numTransactions'] = this.numTransactions;
    data['numReveals'] = this.numReveals;
    data['numMigrations'] = this.numMigrations;
    data['firstActivity'] = this.firstActivity;
    data['firstActivityTime'] = this.firstActivityTime;
    data['lastActivity'] = this.lastActivity;
    data['lastActivityTime'] = this.lastActivityTime;
    if (this.contracts != null) {
      data['contracts'] = this.contracts.map((v) => v.toJson()).toList();
    }
    if (this.delegators != null) {
      data['delegators'] = this.delegators.map((v) => v.toJson()).toList();
    }
    if (this.operations != null) {
      data['operations'] = this.operations.map((v) => v.toJson()).toList();
    }
    if (this.metadata != null) {
      data['metadata'] = this.metadata.toJson();
    }
    if (this.software != null) {
      data['software'] = this.software.toJson();
    }
    return data;
  }

  @override
  String get getType => type;
}

class Contracts {
  String kind;
  String alias;
  String address;
  int balance;
  Delegate delegate;
  int creationLevel;
  String creationTime;

  Contracts(
      {this.kind,
      this.alias,
      this.address,
      this.balance,
      this.delegate,
      this.creationLevel,
      this.creationTime});

  Contracts.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    alias = json['alias'];
    address = json['address'];
    balance = json['balance'];
    delegate = json['delegate'] != null
        ? new Delegate.fromJson(json['delegate'])
        : null;
    creationLevel = json['creationLevel'];
    creationTime = json['creationTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['kind'] = this.kind;
    data['alias'] = this.alias;
    data['address'] = this.address;
    data['balance'] = this.balance;
    if (this.delegate != null) {
      data['delegate'] = this.delegate.toJson();
    }
    data['creationLevel'] = this.creationLevel;
    data['creationTime'] = this.creationTime;
    return data;
  }
}

class Delegate {
  String alias;
  String address;
  bool active;

  Delegate({this.alias, this.address, this.active});

  Delegate.fromJson(Map<String, dynamic> json) {
    alias = json['alias'];
    address = json['address'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['alias'] = this.alias;
    data['address'] = this.address;
    data['active'] = this.active;
    return data;
  }
}

class Delegators {
  String type;
  String alias;
  String address;
  int balance;
  int delegationLevel;
  String delegationTime;

  Delegators(
      {this.type,
      this.alias,
      this.address,
      this.balance,
      this.delegationLevel,
      this.delegationTime});

  Delegators.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    alias = json['alias'];
    address = json['address'];
    balance = json['balance'];
    delegationLevel = json['delegationLevel'];
    delegationTime = json['delegationTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['alias'] = this.alias;
    data['address'] = this.address;
    data['balance'] = this.balance;
    data['delegationLevel'] = this.delegationLevel;
    data['delegationTime'] = this.delegationTime;
    return data;
  }
}

class Software {
  String version;
  String date;

  Software({this.version, this.date});

  Software.fromJson(Map<String, dynamic> json) {
    version = json['version'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['version'] = this.version;
    data['date'] = this.date;
    return data;
  }
}
