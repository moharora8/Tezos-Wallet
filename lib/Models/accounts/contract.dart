import '../account.dart';
import '../accounts/metadata.dart';
import '../operations.dart';

class ContractAccount extends Accounts {
  static String type = 'contract';
  String kind;
  List<String> tzips;
  String privateKey;
  String secret;
  String alias;
  String address;
  int balance;
  Creator creator;
  Manager manager;
  Delegate delegate;
  int delegationLevel;
  String delegationTime;
  int numContracts;
  int numDelegations;
  int numOriginations;
  int numTransactions;
  int numReveals;
  int numMigrations;
  int firstActivity;
  String firstActivityTime;
  int lastActivity;
  String lastActivityTime;
  Null storage;
  int typeHash;
  int codeHash;
  List<Contracts> contracts;
  List<Operation> operations = [];
  Metadata metadata;

  ContractAccount(
      {this.secret,
      this.privateKey,
      this.kind,
      this.tzips,
      this.alias,
      this.address,
      this.balance,
      this.creator,
      this.manager,
      this.delegate,
      this.delegationLevel,
      this.delegationTime,
      this.numContracts,
      this.numDelegations,
      this.numOriginations,
      this.numTransactions,
      this.numReveals,
      this.numMigrations,
      this.firstActivity,
      this.firstActivityTime,
      this.lastActivity,
      this.lastActivityTime,
      this.storage,
      this.typeHash,
      this.codeHash,
      this.contracts,
      this.operations,
      this.metadata});

  ContractAccount.fromJson(
      Map<String, dynamic> json, this.secret, this.privateKey) {
    kind = json['kind'];
    tzips = json['tzips'].cast<String>();
    alias = json['alias'];
    address = json['address'];
    balance = json['balance'];
    creator =
        json['creator'] != null ? new Creator.fromJson(json['creator']) : null;
    manager =
        json['manager'] != null ? new Manager.fromJson(json['manager']) : null;
    delegate = json['delegate'] != null
        ? new Delegate.fromJson(json['delegate'])
        : null;
    delegationLevel = json['delegationLevel'];
    delegationTime = json['delegationTime'];
    numContracts = json['numContracts'];
    numDelegations = json['numDelegations'];
    numOriginations = json['numOriginations'];
    numTransactions = json['numTransactions'];
    numReveals = json['numReveals'];
    numMigrations = json['numMigrations'];
    firstActivity = json['firstActivity'];
    firstActivityTime = json['firstActivityTime'];
    lastActivity = json['lastActivity'];
    lastActivityTime = json['lastActivityTime'];
    storage = json['storage'];
    typeHash = json['typeHash'];
    codeHash = json['codeHash'];
    if (json['contracts'] != null) {
      contracts = new List<Contracts>();
      json['contracts'].forEach((v) {
        contracts.add(new Contracts.fromJson(v));
      });
    }
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kind'] = this.kind;
    data['tzips'] = this.tzips;
    data['alias'] = this.alias;
    data['address'] = this.address;
    data['balance'] = this.balance;
    if (this.creator != null) {
      data['creator'] = this.creator.toJson();
    }
    if (this.manager != null) {
      data['manager'] = this.manager.toJson();
    }
    if (this.delegate != null) {
      data['delegate'] = this.delegate.toJson();
    }
    data['delegationLevel'] = this.delegationLevel;
    data['delegationTime'] = this.delegationTime;
    data['numContracts'] = this.numContracts;
    data['numDelegations'] = this.numDelegations;
    data['numOriginations'] = this.numOriginations;
    data['numTransactions'] = this.numTransactions;
    data['numReveals'] = this.numReveals;
    data['numMigrations'] = this.numMigrations;
    data['firstActivity'] = this.firstActivity;
    data['firstActivityTime'] = this.firstActivityTime;
    data['lastActivity'] = this.lastActivity;
    data['lastActivityTime'] = this.lastActivityTime;
    data['storage'] = this.storage;
    data['typeHash'] = this.typeHash;
    data['codeHash'] = this.codeHash;
    if (this.contracts != null) {
      data['contracts'] = this.contracts.map((v) => v.toJson()).toList();
    }
    if (this.operations != null) {
      data['operations'] = this.operations.map((v) => v.toJson()).toList();
    }
    if (this.metadata != null) {
      data['metadata'] = this.metadata.toJson();
    }
    return data;
  }

  @override
  String get getType => type;
}

class Creator {
  String alias;
  String address;

  Creator({this.alias, this.address});

  Creator.fromJson(Map<String, dynamic> json) {
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

class Manager {
  String alias;
  String address;
  String publicKey;

  Manager({this.alias, this.address, this.publicKey});

  Manager.fromJson(Map<String, dynamic> json) {
    alias = json['alias'];
    address = json['address'];
    publicKey = json['publicKey'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['alias'] = this.alias;
    data['address'] = this.address;
    data['publicKey'] = this.publicKey;
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
