import 'dart:convert';

import 'package:devfest_tezos/ui/pages/home.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../config.dart';
import '../../../state_management/appstate.dart';
import 'package:tezster_dart/tezster_dart.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:file_picker/file_picker.dart';

class FaucetView extends StatefulWidget {
  const FaucetView({Key key, this.afterImport}) : super(key: key);
  final Function afterImport;
  @override
  _FaucetViewState createState() => _FaucetViewState();
}

class _FaucetViewState extends State<FaucetView> {
  TextEditingController con = new TextEditingController();
  bool isPicked = false;
  String faucetVal;
  String fileName = '';
  Future filePicker() async {
    FilePickerResult result =
        await FilePicker.platform.pickFiles(type: FileType.any);
    if (result != null) {
      PlatformFile file = result.files.first;
      print(file.name);
      setState(() {
        fileName = file.name;
        isPicked = true;
      });
      print(file.bytes);
      print(file.size);
      print(file.extension);
      print(file.path);
    } else {
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    var _screensize = MediaQuery.of(context).size;
    String mneomics = '', password = '', email = '';
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          SizedBox(height: 10),
          Text(
            'Faucet File',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Text.rich(
              TextSpan(
                  text:
                      'Copy the data from faucet file and paste it here. You can download it from ',
                  style: Theme.of(context).textTheme.headline4,
                  children: <TextSpan>[
                    TextSpan(
                        text: 'https://faucet.tzalpha.net',
                        style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).textTheme.headline1.color,
                            fontSize: 16),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            const url = 'https://faucet.tzalpha.net';
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          }),
                  ]),
            ),
          ),
          SizedBox(height: 10),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                child: TextFormField(
                    controller: con,
                    maxLines: 6,
                    cursorColor: Theme.of(context).buttonColor,
                    decoration: InputDecoration(
                      hintText: 'Enter Faucet file\'s data here',
                      border: new OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Theme.of(context).buttonColor,
                          width: 3,
                        ),
                      ),
                      focusColor: Theme.of(context).buttonColor,
                    ),
                    onChanged: (key) {
                      TextSelection previousSelection = con.selection;
                      con.text = key;
                      con.selection = previousSelection;
                    }),
              ),
              Positioned(
                  bottom: 1,
                  right: 1,
                  child: IconButton(
                    icon: Icon(Icons.delete,
                        color: Theme.of(context).buttonColor),
                    onPressed: () {
                      setState(() {
                        con.text = '';
                      });
                    },
                  )),
            ],
          ),
          SizedBox(height: 10),
          con.text != null && con.text.isNotEmpty
              ? InkWell(
                  onTap: () async {
                    final decodedMap = json.decode(con.text);
                    print(decodedMap);
                    String mne = decodedMap['mnemonic'].join(' ');
                    print(mne);
                    print(decodedMap['password']);

                    if (decodedMap['password'] == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Something Went Wrong')));
                    } else {
                      AppState.instance.showProgress();
                      try {
                        List<String> keys = [
                          decodedMap['secret'],
                          '',
                          decodedMap['pkh']
                        ];
                        // await TezsterDart.unlockFundraiserIdentity(
                        //     email: decodedMap['email'],
                        //     passphrase: decodedMap['password'],
                        //     mnemonic: mne);
                        // await TezsterDart.getKeysFromMnemonicAndPassphrase(
                        //     mnemonic: mne, passphrase: decodedMap['password']);
                        if (keys.length != 3) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Something went Wrong')));
                          return;
                        }

                        print(keys);
                        AppState.instance.addAccount(keys);
                        await TezoApp.sharedPreferences
                            .setString(TezoApp.accountCreated, 'yes');
                        AppState.instance.dismissprogress();
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Home()));
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Something went Wrong')));
                        return;
                      }
                      //AppState.instance.dismissprogress();
                    }
                  },
                  child: Center(
                    child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).buttonColor,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                        //margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Center(
                            child: Text('Import Account',
                                style: Theme.of(context).textTheme.headline3)),
                        width: 110,
                        height: 50),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
