import 'package:devfest_tezos/plugins/tezster.dart';
import 'package:devfest_tezos/ui/widgets/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'seedPhrase.dart';

class Pass extends StatefulWidget {
  const Pass({Key key}) : super(key: key);

  @override
  State<Pass> createState() => _PassState();
}

class _PassState extends State<Pass> {
  String mneomonic;
  bool agreement = false;
  TextEditingController pass = new TextEditingController();
  TextEditingController againpass = new TextEditingController();
  @override
  void initState() {
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
                        Text('Create a new Wallet'),
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
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Password'),
                      Text('A Password is used to protect the wallet',
                          style: Theme.of(context).textTheme.headline1),
                      SizedBox(height: 10),
                      CustomTextField(
                        hintText: 'Enter your password',
                        enable: true,
                        autofocus: false,
                        type1: TextInputType.text,
                        isObsecure: true,
                        controller: pass,
                        f: (value) {
                          pass.text = value;
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Repeat Password'),
                      Text('Please enter the password again',
                          style: Theme.of(context).textTheme.headline1),
                      SizedBox(height: 10),
                      CustomTextField(
                        hintText: 'Enter your password again',
                        enable: true,
                        autofocus: false,
                        type1: TextInputType.text,
                        isObsecure: true,
                        controller: againpass,
                        f: (value) {
                          againpass.text = value;
                        },
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
                            'Accept terms',
                          ),
                          Container(
                            child: Text(
                                'I have read and agree to \nthe Terms of Usage and Privacy Policy',
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
                    print(pass.text);
                    print(againpass.text);

                    if (pass.text == null || againpass.text == null) {
                      print('Kindly enter password first');
                    } else {
                      if (agreement != true) {
                        print('Kindly Accept Terms and conditions');
                      } else {
                        if (pass.text != againpass.text) {
                          print('passwords do not match');
                        } else {
                          setState(() {
                            mneomonic = TezsterDart.generateMnemonic();
                          });
                          print(mneomonic);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SeedPhrase(
                                      mneomonic: mneomonic, pass: pass.text)));
                        }
                      }
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
                          child: Text('Create',
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
