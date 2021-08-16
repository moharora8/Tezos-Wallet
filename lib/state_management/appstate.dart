import 'dart:convert';

import 'package:devfest_tezos/ui/pages/import/import.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Models/account.dart';
import '../Models/accounts/contract.dart';
import '../Models/accounts/delegate.dart';
import '../Models/accounts/empty.dart';
import '../Models/accounts/user.dart';
import '../Models/operations.dart';
import '../Networking/networking.dart';
import 'package:tezster_dart/tezster_dart.dart';

class AppState {
  AppState._();
  static AppState instance = AppState._();

  SharedPreferences pref;
  static GlobalKey<NavigatorState> naviagtorKey = GlobalKey();

  List<String> accountsAddress = [];

  List<Accounts> accounts = [];
  int selectedAccount = 0;

  String selectedNetwork = 'Mainnet';

  void init() async {
    pref = await SharedPreferences.getInstance();
    accountsAddress = pref.getStringList('accountsAddress') ?? [];
    selectedNetwork = pref.getString('selectedNetwork') ?? selectedNetwork;
    if (accountsAddress.isEmpty) {
      naviagtorKey.currentState.pushReplacement(
          MaterialPageRoute(builder: (context) => ImportAccount()));
    } else {
      await refreshAccounts();
    }
    _updateSink.add(true);
  }

  void addAccount(List<String> keys) async {
    for (var address in accountsAddress) {
      if (address == keys[2]) {
        //Scaffold Maybe
        return;
      }
    }
    accountsAddress.add(keys[2]);
    if (accountsAddress != null) {
      pref.setStringList('accountsAddress', accountsAddress);
    }

    pref.setString('${keys[2]}-se', keys[0]);
    pref.setString('${keys[2]}-pr', keys[1]);
    var response = await getAccountInfo(selectedNetwork, keys[2]);
    accounts.add(accountFromJsonString(response.body, keys[0], keys[1]));
    _updateSink.add(true);
  }

  void changeSelectedNetwork(String network) async {
    selectedNetwork = network;
    pref.setString('selectedNetwork', selectedNetwork);
    refreshAccounts();
    _updateSink.add(true);
  }

  final BehaviorSubject<bool> _appStream = BehaviorSubject();
  Stream<bool> get updatesStream => _appStream.stream;
  Sink get _updateSink => _appStream.sink;

  String getAccountAddressCurrent() {
    Accounts account;
    if (AppState.instance.accounts.isNotEmpty) {
      account = AppState.instance.accounts[AppState.instance.selectedAccount];
    }
    if (account != null && account.getType == UserAccount.type) {
      return (account as UserAccount).address;
    } else if (account != null && account.getType == ContractAccount.type) {
      return (account as ContractAccount).address;
    } else if (account != null && account.getType == DelegateAccount.type) {
      return (account as DelegateAccount).address;
    } else if (account != null && account.getType == EmptyAccount.type) {
      return (account as EmptyAccount).address;
    }
    return 'Something Went Wrong!';
  }

  String getBalanceAccountCurrent() {
    Accounts account;
    if (AppState.instance.accounts.isNotEmpty) {
      account = AppState.instance.accounts[AppState.instance.selectedAccount];
    }
    if (account != null && account.getType == UserAccount.type) {
      return ((account as UserAccount).balance / 1000000).toString();
    } else if (account != null && account.getType == ContractAccount.type) {
      return ((account as ContractAccount).balance / 1000000).toString();
    } else if (account != null && account.getType == DelegateAccount.type) {
      return ((account as DelegateAccount).balance / 1000000).toString();
    } else if (account != null && account.getType == EmptyAccount.type) {
      return ((account as EmptyAccount).balance / 1000000).toString();
    }
    return 'Something Went Wrong!';
  }

  void makeTransaction(String account, double ammount) async {
    showProgress();

    List<String> keys = getSelectedAccountkeys();
    var keyStore = KeyStoreModel(
      publicKey: keys[1],
      secretKey: keys[0],
      publicKeyHash: keys[2],
    );

    var signer = await TezsterDart.createSigner(
        TezsterDart.writeKeyWithHint(keyStore.secretKey, 'edsk'));

    var result = await TezsterDart.sendTransactionOperation(
      networksChains[selectedNetwork],
      signer,
      keyStore,
      account,
      (ammount * 1000000).toInt(),
      10000,
    );

    dismissprogress();
  }

  Future<void> refreshAccounts() async {
    showProgress();
    List<Accounts> temp = [];
    for (var address in accountsAddress) {
      var response = await getAccountInfo(selectedNetwork, address);
      temp.add(accountFromJsonString(response.body,
          pref.getString('$address-pr'), pref.getString('$address-se')));
      _setOperations(temp.last);
    }
    accounts = temp;
    _updateSink.add(true);
    dismissprogress();
  }

  void _setOperations(Accounts _account) async {
    if (_account != null && _account.getType == UserAccount.type) {
      UserAccount t = _account;
      var response = await getAccountOperations(selectedNetwork, t.address);
      var data = jsonDecode(response.body);
      t.operations =
          (data as List).map((e) => operationFromJsonString(e)).toList();
    } else if (_account != null && _account.getType == ContractAccount.type) {
      ContractAccount t = _account;
      var response = await getAccountOperations(selectedNetwork, t.address);
      var data = jsonDecode(response.body);
      t.operations =
          (data as List).map((e) => operationFromJsonString(e)).toList();
    } else if (_account != null && _account.getType == DelegateAccount.type) {
      DelegateAccount t = _account;
      var response = await getAccountOperations(selectedNetwork, t.address);
      var data = jsonDecode(response.body);
      t.operations =
          (data as List).map((e) => operationFromJsonString(e)).toList();
    }
    _updateSink.add(true);
  }

  List<String> getSelectedAccountkeys() {
    Accounts _account;
    if (AppState.instance.accounts.isNotEmpty) {
      _account = AppState.instance.accounts[AppState.instance.selectedAccount];
    }
    if (_account != null && _account.getType == UserAccount.type) {
      UserAccount t = _account;
      return [t.secret, t.privateKey, t.address];
    } else if (_account != null && _account.getType == ContractAccount.type) {
      ContractAccount t = _account;
      return [t.secret, t.privateKey, t.address];
    } else if (_account != null && _account.getType == DelegateAccount.type) {
      DelegateAccount t = _account;
      return [t.secret, t.privateKey, t.address];
    } else if (_account != null && _account.getType == EmptyAccount.type) {
      EmptyAccount t = _account;
      return [t.secret, t.privateKey, t.address];
    }
    return [];
  }

  List<Operation> getSelectedAccountOperations() {
    Accounts _account;
    if (AppState.instance.accounts.isNotEmpty) {
      _account = AppState.instance.accounts[AppState.instance.selectedAccount];
    }
    if (_account != null && _account.getType == UserAccount.type) {
      UserAccount t = _account;
      return t.operations;
    } else if (_account != null && _account.getType == ContractAccount.type) {
      ContractAccount t = _account;
      return t.operations;
    } else if (_account != null && _account.getType == DelegateAccount.type) {
      DelegateAccount t = _account;
      return t.operations;
    } else if (_account != null && _account.getType == EmptyAccount.type) {
      EmptyAccount t = _account;
      return [];
    }
    return [];
  }

  void _showErrorDialog(String event) {
    final context = naviagtorKey.currentState?.context;
    final dialog = AlertDialog(
      content: Text('$event'),
    );
    showDialog(context: context, builder: (x) => dialog);
  }

  void showProgress() {
    final context = naviagtorKey.currentContext;
    final dialog = Center(
        child: Container(
            child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).buttonColor)),
            height: 100,
            width: 100,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            )));
    showDialog(
        context: context, builder: (x) => dialog, barrierDismissible: false);
  }

  void dismissprogress() {
    naviagtorKey.currentState.pop();
  }
}
