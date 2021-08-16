import 'package:devfest_tezos/ui/pages/home.dart';
import 'package:devfest_tezos/ui/widgets/import_account/faucet.dart';
import 'package:devfest_tezos/ui/widgets/import_account/fundraiser_view.dart';
import 'package:devfest_tezos/ui/widgets/import_account/mnemonic_view.dart';
import 'package:devfest_tezos/ui/widgets/import_account/private_keyview.dart';
import 'package:flutter/material.dart';
import '../../widgets/import_account/fundraiser_view.dart';
import '../../widgets/import_account/mnemonic_view.dart';
import '../../widgets/import_account/private_keyview.dart';

class ImportAccount extends StatefulWidget {
  @override
  State<ImportAccount> createState() => _ImportAccountState();
}

class _ImportAccountState extends State<ImportAccount> {
  int selectedValue = 0;
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
        child: Column(
          children: [
            Padding(
                child: Column(
                  children: [
                    Text('Import Account'),
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
            SizedBox(
              height: 10,
            ),
            Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                decoration: BoxDecoration(
                    color: Theme.of(context).buttonColor,
                    borderRadius: BorderRadius.circular(7)),
                child: Text(
                    'Import your account if exists otherwise create a new one from previous screen.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline5),
                height: 60),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buttons('Private Key', 0),
                buttons('Mnemonic', 1),
              ],
            ),
            //SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buttons('Fundraiser', 2),
                buttons('Faucet File', 3),
              ],
            ),
            if (selectedValue == 0)
              PrivateKey(
                afterImport: afterImport,
              ),
            if (selectedValue == 1)
              MnemonicView(
                afterImport: afterImport,
              ),
            if (selectedValue == 2)
              FundraiserView(
                afterImport: afterImport,
              ),
            if (selectedValue == 3)
              FaucetView(
                afterImport: afterImport,
              ),
          ],
        ),
      ),
    );
  }

  void afterImport() {
    // if (widget.firstLogin) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Home()));
    // } else {
    //   Navigator.pop(context);
    // }
  }

  Widget buttons(String text, int val) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
        child: ElevatedButton(
          onPressed: () => setState(() {
            selectedValue = val;
          }),
          child: Text(
            text,
            style: TextStyle(
                color: selectedValue == val
                    ? Theme.of(context).textTheme.headline2.color
                    : Theme.of(context).textTheme.headline1.color),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(selectedValue == val
                ? Theme.of(context).buttonColor
                : Colors.white),
            side: MaterialStateProperty.all(
                BorderSide(color: Theme.of(context).buttonColor)),
          ),
        ));
  }
}
