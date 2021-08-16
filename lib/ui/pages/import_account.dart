import 'package:flutter/material.dart';
import '../pages/landing.dart';
import '../widgets/import_account/fundraiser_view.dart';
import '../widgets/import_account/mnemonic_view.dart';
import '../widgets/import_account/private_keyview.dart';

class ImportAccount extends StatefulWidget {
  const ImportAccount({Key key, this.firstLogin = false}) : super(key: key);
  final bool firstLogin;
  @override
  State<ImportAccount> createState() => _ImportAccountState();
}

class _ImportAccountState extends State<ImportAccount> {
  int selectedValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
        title: Text(
          'Tezos Wallet',
        ),
        leading: widget.firstLogin
            ? null
            : IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.deepPurple[200],
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.firstLogin ? 'Create account' : 'Import account'),
                  Icon(Icons.file_download)
                ],
              ),
            ),
            if (widget.firstLogin) Text('Import/Create a account to continue'),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buttons('Private Key', 0),
                buttons('Mnemonic', 1),
                buttons('Fundraiser', 2),
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
          ],
        ),
      ),
    );
  }

  void afterImport() {
    if (widget.firstLogin) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LandingPage()));
    } else {
      Navigator.pop(context);
    }
  }

  Widget buttons(String text, int val) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
        child: ElevatedButton(
          onPressed: () => setState(() {
            selectedValue = val;
          }),
          child: Text(
            text,
            style: TextStyle(
                color: selectedValue == val ? Colors.white : Colors.grey[700]),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                selectedValue == val ? Colors.deepPurpleAccent : Colors.white),
          ),
        ));
  }
}
