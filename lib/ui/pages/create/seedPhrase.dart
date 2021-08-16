import 'dart:math';

import 'package:devfest_tezos/plugins/tezster.dart';
import 'package:devfest_tezos/state_management/appstate.dart';
import 'package:devfest_tezos/ui/widgets/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../config.dart';
import '../home.dart';

class SeedPhrase extends StatefulWidget {
  String pass;
  String mneomonic;
  SeedPhrase({this.pass, this.mneomonic});
  @override
  State<SeedPhrase> createState() => _SeedPhraseState();
}

class _SeedPhraseState extends State<SeedPhrase> {
  bool seecode = false;
  bool agreement = false;
  TextEditingController word1 = new TextEditingController();
  TextEditingController word2 = new TextEditingController();
  @override
  void initState() {
    print(widget.pass + 'Seed');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _screensize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).buttonColor,
          centerTitle: true,
          title: Text(
            'Tezos Wallet',
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                    child: Column(
                      children: [
                        Text('Backup new Seed Phrase'),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                            height: 2,
                            width: _screensize.width,
                            color: Colors.black26),
                      ],
                    ),
                    padding: EdgeInsets.all(10)),
                SizedBox(height: 10),
                Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    decoration: BoxDecoration(
                        color: Theme.of(context).buttonColor,
                        borderRadius: BorderRadius.circular(7)),
                    child: Text(
                        'Click on area below to reveal your new Seed Phrase. Then, write this phrase on a piece of paper and store in a secure location. Or you can memorize it. DO NOT Share this phrase with anyone! It can be used to steal all your accounts.',
                        style: Theme.of(context).textTheme.headline5),
                    height: 130),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Seed phrase'),
                      Text(
                          'If you ever switch devices, you will need this phrase to accessyour accounts.',
                          style: Theme.of(context).textTheme.headline1),
                      SizedBox(height: 10),
                      Stack(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                seecode = !seecode;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.fromLTRB(5, 5, 5, 20),
                              height: 110,
                              child: seecode == false
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.lock,
                                                color: Theme.of(context)
                                                    .buttonColor),
                                            SizedBox(width: 10),
                                            Text(
                                              'PROTECTED',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline4,
                                            ),
                                          ],
                                        ),
                                        Text(
                                            'Click to reveal or edit this field',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline4),
                                      ],
                                    )
                                  : Text(widget.mneomonic,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Theme.of(context).buttonColor,
                                      width: 3),
                                  borderRadius: BorderRadius.circular(7)),
                            ),
                          ),
                          seecode == true
                              ? Positioned(
                                  bottom: 1,
                                  right: 1,
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        ElevatedButton(
                                            onPressed: () {
                                              Clipboard.setData(ClipboardData(
                                                  text: widget.mneomonic));
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      content: Text(
                                                          'Copied To clipboard')));
                                            },
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Theme.of(context)
                                                            .buttonColor)),
                                            child: Row(
                                              children: [
                                                Icon(Icons.copy),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text('Copy To ClipBoard'),
                                              ],
                                            )),
                                      ]),
                                )
                              : SizedBox(),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 3,
                      color: Theme.of(context).buttonColor,
                    ),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  height: 90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                          activeColor: Theme.of(context).buttonColor,
                          value: agreement,
                          onChanged: (val) {
                            setState(() {
                              agreement = val;
                            });
                          }),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'I made Seed Phrase backup',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          Container(
                            child: Text(
                                'And accept the risks that if I lose \nthe phrase, my funds may be lost.',
                                style: Theme.of(context).textTheme.headline1),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    if (agreement) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VerifyPhrase(
                                  mneomonic: widget.mneomonic,
                                  pass: widget.pass)));
                    } else {
                      print('Accepts terms');
                    }
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).buttonColor,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Center(
                          child: Text('Proceed',
                              style: Theme.of(context).textTheme.headline3)),
                      width: 140,
                      height: 50),
                ),
              ],
            ),
          ),
        ));
  }
}

class VerifyPhrase extends StatefulWidget {
  String pass;
  String mneomonic;
  VerifyPhrase({this.pass, this.mneomonic});
  @override
  State<VerifyPhrase> createState() => _VerifyPhraseState();
}

class _VerifyPhraseState extends State<VerifyPhrase> {
  TextEditingController word1 = new TextEditingController();
  TextEditingController word2 = new TextEditingController();
  int rand1;
  int rand2;
  List<String> temp = [];
  @override
  void initState() {
    print(widget.pass + 'Phrase');
    Random random = new Random();
    rand1 = random.nextInt(10) + 1;
    rand2 = random.nextInt(10) + 1;
    temp = widget.mneomonic.split(' ');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _screensize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).buttonColor,
          centerTitle: true,
          title: Text(
            'Tezos Wallet',
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                    child: Column(
                      children: [
                        Text('Verify Seed Phrase'),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                            height: 2,
                            width: _screensize.width,
                            color: Colors.black26),
                      ],
                    ),
                    padding: EdgeInsets.all(10)),
                SizedBox(height: 10),
                Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    decoration: BoxDecoration(
                        color: Theme.of(context).buttonColor,
                        borderRadius: BorderRadius.circular(7)),
                    child: Text(
                        'Fill in the blank fields with the words to verify your seed phrase backup.',
                        style: Theme.of(context).textTheme.headline3),
                    height: 90),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: _screensize.width * 0.42,
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Word $rand1'),
                          SizedBox(height: 10),
                          CustomTextField(
                            hintText: 'Enter value',
                            enable: true,
                            autofocus: false,
                            type1: TextInputType.text,
                            isObsecure: true,
                            controller: word1,
                            f: (value) {
                              word1.text = value;
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: _screensize.width * 0.42,
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Word $rand2'),
                          SizedBox(height: 10),
                          CustomTextField(
                            hintText: 'Enter value',
                            enable: true,
                            autofocus: false,
                            type1: TextInputType.text,
                            isObsecure: true,
                            controller: word2,
                            f: (value) {
                              word2.text = value;
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: () async {
                    print(word1.text);
                    print(word2.text);
                    if (temp[rand1 - 1] == word1.text) {
                      if (temp[rand2 - 1] == word2.text) {
                        print('Success');
                        AppState.instance.showProgress();
                        try {
                          List<String> keys = await TezsterDart
                              .getKeysFromMnemonicAndPassphrase(
                                  mnemonic: widget.mneomonic,
                                  passphrase: widget.pass);
                          if (keys.length != 3) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('Something went Wrong')));
                            return;
                          }
                          AppState.instance.addAccount(keys);
                          await TezoApp.sharedPreferences
                              .setString(TezoApp.accountCreated, 'yes');
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Something went Wrong')));
                          return;
                        }
                        AppState.instance.dismissprogress();
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Home()));
                      } else {
                        print('Invalid word 2');
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Invalid word 2')));
                      }
                    } else {
                      print('Invalid word 1');
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Invalid word 1')));
                    }
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).buttonColor,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Center(
                          child: Text('Finish',
                              style: Theme.of(context).textTheme.headline3)),
                      width: 140,
                      height: 50),
                ),
              ],
            ),
          ),
        ));
  }
}
