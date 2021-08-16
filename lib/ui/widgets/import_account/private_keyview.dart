import 'package:flutter/material.dart';
import '../../../state_management/appstate.dart';
import 'package:tezster_dart/tezster_dart.dart';

class PrivateKey extends StatefulWidget {
  const PrivateKey({Key key, this.afterImport}) : super(key: key);
  final Function afterImport;
  @override
  _PrivateKeyState createState() => _PrivateKeyState();
}

class _PrivateKeyState extends State<PrivateKey> {
  String privateKey = '', forgedOperation = '';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          SizedBox(height: 10),
          Text(
            'Private key',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            'The Secret key of the Account you want to import.',
            style: Theme.of(context).textTheme.headline1,
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: TextFormField(
              cursorColor: Theme.of(context).buttonColor,
              decoration: InputDecoration(
                border: new OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Theme.of(context).buttonColor,
                    width: 3,
                  ),
                ),
                focusColor: Theme.of(context).buttonColor,
              ),
              onChanged: (key) => privateKey = key,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Forged Operations',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: TextFormField(
              cursorColor: Theme.of(context).buttonColor,
              decoration: InputDecoration(
                border: new OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Theme.of(context).buttonColor,
                    width: 3,
                  ),
                ),
              ),
              onChanged: (key) => forgedOperation = key,
            ),
          ),
          SizedBox(height: 10),
          InkWell(
            onTap: () async {
              if ((privateKey == null || privateKey.isEmpty) ||
                  (forgedOperation == null || forgedOperation.isEmpty)) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Something Went Wrong')));
              } else {
                AppState.instance.showProgress();
                try {
                  List<String> keys = await TezsterDart.signOperationGroup(
                      privateKey: privateKey, forgedOperation: forgedOperation);
                  if (keys.length != 2) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Something went Wrong')));
                    return;
                  }
                  print(keys);
                  AppState.instance.addAccount(keys);
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Under Construction')));
                  widget.afterImport();
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Something went Wrong')));
                  return;
                }
                AppState.instance.dismissprogress();
              }
            },
            child: Center(
              child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).buttonColor,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Center(
                      child: Text('Import Account',
                          style: Theme.of(context).textTheme.headline3)),
                  width: 110,
                  height: 50),
            ),
          ),
        ],
      ),
    );
  }
}
