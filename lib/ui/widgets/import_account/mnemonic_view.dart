import 'package:devfest_tezos/ui/pages/home.dart';
import 'package:flutter/material.dart';
import '../../../config.dart';
import '../../../state_management/appstate.dart';
import 'package:tezster_dart/tezster_dart.dart';

class MnemonicView extends StatefulWidget {
  const MnemonicView({Key key, this.afterImport}) : super(key: key);
  final Function afterImport;
  @override
  _MnemonicViewState createState() => _MnemonicViewState();
}

class _MnemonicViewState extends State<MnemonicView> {
  String password = '';
  TextEditingController mneomics = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          SizedBox(height: 10),
          Text(
            'Seed phrase',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            'Mnemonic. Your secret word phrase.',
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
              controller: mneomics,
              textInputAction: TextInputAction.next,
              onChanged: (key) {
                TextSelection previousSelection = mneomics.selection;
                mneomics.text = key;
                mneomics.selection = previousSelection;
              },
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Password',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            'Used for additional mnemonic derivation. That is NOT a wallet password.',
            style: Theme.of(context).textTheme.headline1,
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: TextFormField(
              textInputAction: TextInputAction.next,
              cursorColor: Theme.of(context).buttonColor,
              controller: passwordC,
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
              onChanged: (key) {
                TextSelection previousSelection = passwordC.selection;
                passwordC.text = key;
                passwordC.selection = previousSelection;
              },
            ),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     ElevatedButton(
          //         onPressed: () {
          //           setState(() {
          //             mneomics.text = TezsterDart.generateMnemonic();
          //           });
          //         },
          //         style: ButtonStyle(
          //             backgroundColor:
          //                 MaterialStateProperty.all(Colors.deepPurple[400])),
          //         child: Row(
          //           children: [
          //             Icon(Icons.create),
          //             SizedBox(
          //               width: 20,
          //             ),
          //             Text('Generate Mnemonic'),
          //           ],
          //         )),
          //   ],
          // ),
          // SizedBox(height: 20),
          // Text(
          //   'Password',
          //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          // ),
          // Text(
          //     'Used for additional mnemonic derivation. That is NOT a wallet password. (Optional)'),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          //   child: TextFormField(
          //     obscureText: true,
          //     decoration: const InputDecoration(
          //       border: OutlineInputBorder(
          //         borderRadius: BorderRadius.all(
          //           Radius.circular(10.0),
          //         ),
          //       ),
          //     ),
          //     onChanged: (key) => password = key,
          //   ),
          // ),
          SizedBox(height: 20),
          InkWell(
            onTap: () async {
              print(mneomics.text);
              print(passwordC.text);
              if (mneomics.text.isNotEmpty && mneomics.text != null) {
                AppState.instance.showProgress();
                try {
                  List<String> keys =
                      await TezsterDart.getKeysFromMnemonicAndPassphrase(
                          mnemonic: mneomics.text, passphrase: passwordC.text);
                  if (keys.length != 3) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Something went Wrong')));
                    return;
                  }
                  AppState.instance.addAccount(keys);
                  await TezoApp.sharedPreferences
                      .setString(TezoApp.accountCreated, 'yes');
                  AppState.instance.dismissprogress();
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => Home()));
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Something went Wrong')));
                  return;
                }
                //AppState.instance.dismissprogress();

              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Something went Wrong')));
              }

              // AppState.instance.showProgress();
              // try {
              //   List<String> keys =
              //       await TezsterDart.getKeysFromMnemonicAndPassphrase(
              //           mnemonic: mneomics.text, passphrase: passwordC.text);
              //   print(keys);
              //   if (keys.length != 3) {
              //     ScaffoldMessenger.of(context).showSnackBar(
              //         SnackBar(content: Text('Something went Wrong')));
              //     return;
              //   }
              //   AppState.instance.addAccount(keys);
              //   ScaffoldMessenger.of(context).showSnackBar(
              //       SnackBar(content: Text('Under Construction')));
              // } catch (e) {
              //   ScaffoldMessenger.of(context).showSnackBar(
              //       SnackBar(content: Text('Something went Wrong')));
              //   return;
              // }
              // AppState.instance.dismissprogress();
              // widget.afterImport();
            },
            child: Center(
              child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).buttonColor,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  //margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Center(
                      child: Text('Import Account',
                          style: Theme.of(context).textTheme.headline3)),
                  width: 110,
                  height: 50),
            ),
          ),
          // ElevatedButton(
          //     onPressed: () async {
          //       AppState.instance.showProgress();
          //       try {
          //         List<String> keys =
          //             await TezsterDart.getKeysFromMnemonicAndPassphrase(
          //                 mnemonic: mneomics.text, passphrase: password);
          //         if (keys.length != 3) {
          //           ScaffoldMessenger.of(context).showSnackBar(
          //               SnackBar(content: Text('Something went Wrong')));
          //           return;
          //         }
          //         AppState.instance.addAccount(keys);
          //       } catch (e) {
          //         ScaffoldMessenger.of(context).showSnackBar(
          //             SnackBar(content: Text('Something went Wrong')));
          //         return;
          //       }
          //       AppState.instance.dismissprogress();
          //       widget.afterImport();
          //     },
          //     style: ButtonStyle(
          //         backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
          //         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          //             RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.circular(10.0),
          //                 side: BorderSide(color: Colors.deepPurple)))),
          //     child: Text('Import account'))
        ],
      ),
    );
  }
}
