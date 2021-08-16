import 'package:flutter/material.dart';
import '../../../state_management/appstate.dart';
import 'package:tezster_dart/tezster_dart.dart';

class FundraiserView extends StatefulWidget {
  const FundraiserView({Key key, this.afterImport}) : super(key: key);
  final Function afterImport;
  @override
  _FundraiserViewState createState() => _FundraiserViewState();
}

class _FundraiserViewState extends State<FundraiserView> {
  @override
  Widget build(BuildContext context) {
    TextEditingController mne = new TextEditingController();
    TextEditingController passC = new TextEditingController();
    TextEditingController emailC = new TextEditingController();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          SizedBox(height: 10),
          Text(
            'Email',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: TextFormField(
              textInputAction: TextInputAction.next,
              cursorColor: Theme.of(context).buttonColor,
              controller: emailC,
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
                TextSelection previousSelection = emailC.selection;
                emailC.text = key;
                emailC.selection = previousSelection;
              },
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          //   child: TextField(
          //       cursorColor: Theme.of(context).buttonColor,
          //       decoration: InputDecoration(
          //         border: new OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(10),
          //           borderSide: BorderSide(
          //             color: Theme.of(context).buttonColor,
          //             width: 3,
          //           ),
          //         ),
          //         focusColor: Theme.of(context).buttonColor,
          //       ),
          //       controller: emailC,
          //       onChanged: (key) {
          //         //TextSelection previousSelection = emailC.selection;
          //         emailC.text = key;
          //         //emailC.selection = previousSelection;
          //       }),
          // ),
          SizedBox(height: 10),
          Text(
            'Password',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: TextFormField(
              textInputAction: TextInputAction.next,
              cursorColor: Theme.of(context).buttonColor,
              controller: passC,
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
                TextSelection previousSelection = passC.selection;
                passC.text = key;
                passC.selection = previousSelection;
              },
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          //   child: TextField(
          //       cursorColor: Theme.of(context).buttonColor,
          //       decoration: InputDecoration(
          //         border: new OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(10),
          //           borderSide: BorderSide(
          //             color: Theme.of(context).buttonColor,
          //             width: 3,
          //           ),
          //         ),
          //         focusColor: Theme.of(context).buttonColor,
          //       ),
          //       controller: passC,
          //       onChanged: (key) {
          //         //TextSelection previousSelection = passC.selection;
          //         passC.text = key;
          //         //passC.selection = previousSelection;
          //       }),
          // ),
          // Text(
          //   'Email',
          //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          //   child: TextFormField(
          //     decoration: const InputDecoration(
          //       border: OutlineInputBorder(
          //         borderRadius: BorderRadius.all(
          //           Radius.circular(10.0),
          //         ),
          //       ),
          //     ),
          //     onChanged: (key) => email = key,
          //   ),
          // ),
          // SizedBox(height: 20),
          // Text(
          //   'Password',
          //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          // ),
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
          SizedBox(height: 10),

          Text(
            'Seed phrase',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            'Mnemonic. Your secret twelve word phrase.',
            style: Theme.of(context).textTheme.headline1,
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: TextFormField(
              textInputAction: TextInputAction.next,
              cursorColor: Theme.of(context).buttonColor,
              controller: mne,
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
                TextSelection previousSelection = mne.selection;
                mne.text = key;
                mne.selection = previousSelection;
              },
            ),
          ),
          // Text(
          //   'Seed phrase',
          //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          // ),
          // Text('Mnemonic. Your secret twelve word phrase.'),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          //   child: TextFormField(
          //     decoration: const InputDecoration(
          //       border: OutlineInputBorder(
          //         borderRadius: BorderRadius.all(
          //           Radius.circular(10.0),
          //         ),
          //       ),
          //     ),
          //     onChanged: (key) => mneomics = key,
          //   ),
          // ),
          SizedBox(height: 10),
          InkWell(
            onTap: () async {
              if (passC.text.isEmpty ||
                  mne.text.isEmpty ||
                  emailC.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Something went Wrong')));
              } else {
                AppState.instance.showProgress();
                try {
                  List<String> keys =
                      await TezsterDart.unlockFundraiserIdentity(
                          email: emailC.text,
                          passphrase: passC.text,
                          mnemonic: mne.text);
                  if (keys.length != 3) {
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
                  //margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
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
          //             await TezsterDart.unlockFundraiserIdentity(
          //                 email: email,
          //                 passphrase: password,
          //                 mnemonic: mneomics);
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
