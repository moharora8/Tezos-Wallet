import 'package:devfest_tezos/ui/widgets/customTextField.dart';
import 'package:flutter/material.dart';
import '../../state_management/appstate.dart';

class SendTransactionPage extends StatefulWidget {
  const SendTransactionPage({Key key}) : super(key: key);

  @override
  _SendTransactionPageState createState() => _SendTransactionPageState();
}

class _SendTransactionPageState extends State<SendTransactionPage> {
  TextEditingController senderController = new TextEditingController();
  TextEditingController recipientController = new TextEditingController();
  TextEditingController amountController = new TextEditingController();
  String account = '';
  double amount = 0;

  @override
  Widget build(BuildContext context) {
    var _screensize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).buttonColor,
        //Colors.deepPurpleAccent,
        centerTitle: true,
        title: Text(
          'Tezos Wallet',
          style: Theme.of(context).textTheme.headline3,
        ),
        leading: IconButton(
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
            Padding(
                child: Column(
                  children: [
                    Text('Send Tez'),
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
              decoration: BoxDecoration(
                border: Border.all(
                  width: 3,
                  color: Theme.of(context).buttonColor,
                ),
                borderRadius: BorderRadius.circular(7),
              ),
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              height: 70,
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Image.asset(
                    'assets/tez.png',
                    height: 34,
                    width: 34,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('${AppState.instance.getBalanceAccountCurrent()} Tez',
                      style: Theme.of(context).textTheme.bodyText2),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Recipient'),
                  Text('Address or Tezos domain to send tez funds to',
                      style: Theme.of(context).textTheme.headline1),
                  SizedBox(height: 10),
                  CustomTextField(
                    hintText:
                        'eg. alice.tex or ${AppState.instance.getAccountAddressCurrent()}',
                    enable: true,
                    autofocus: false,
                    type1: TextInputType.text,
                    isObsecure: false,
                    controller: recipientController,
                    f: (value) {
                      recipientController.text = value;
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Amount'),
                  // Text('Address or Tezos domain to send tez funds to',
                  //     style: Theme.of(context).textTheme.headline1),
                  SizedBox(height: 10),
                  CustomTextField(
                    suffix: 'tez',
                    hintText: 'eg. 123.45',
                    enable: true,
                    autofocus: false,
                    type1: TextInputType.numberWithOptions(decimal: true),
                    isObsecure: false,
                    controller: amountController,
                    f: (value) {
                      amountController.text = value;
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text('Default gas fee : 10000 mutez',
                style: Theme.of(context).textTheme.headline4),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                if (recipientController.text != null &&
                    double.parse(amountController.text) != null) {
                  _makeTransation();
                } else {
                  print('Invalid');
                }
              },
              child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Theme.of(context).buttonColor,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Text('Send',
                      style: Theme.of(context).textTheme.headline3),
                  width: 140,
                  height: 50),
            ),
          ],
        ),
      ),
    );
  }

  void _makeTransation() async {
    AppState.instance.makeTransaction(
        recipientController.text, double.parse(amountController.text));
    Navigator.pop(context);
  }
}
