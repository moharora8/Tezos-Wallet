import 'package:flutter/material.dart';
import '../../state_management/appstate.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ReceivePage extends StatefulWidget {
  const ReceivePage({Key key}) : super(key: key);

  @override
  _ReceivePageState createState() => _ReceivePageState();
}

class _ReceivePageState extends State<ReceivePage> {
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
                    Text('Receive Tez'),
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
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Address',
                  ),
                  Text(
                      'Your current account address. Share it to receive funds.',
                      style: Theme.of(context).textTheme.headline1),
                  Stack(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(30, 20, 30, 60),
                            child: Text(
                              AppState.instance.getAccountAddressCurrent(),
                              style: TextStyle(fontSize: 16),
                            ),
                          )),
                      Positioned(
                        bottom: 1,
                        right: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  Clipboard.setData(ClipboardData(
                                      text: AppState.instance
                                          .getAccountAddressCurrent()));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content:
                                              Text('Copied To clipboard')));
                                },
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Theme.of(context).buttonColor)),
                                child: Row(
                                  children: [
                                    Icon(Icons.copy),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text('Copy To ClipBoard'),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                      child: Text(
                    'QR Code',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: QrImage(
                      data: AppState.instance.getAccountAddressCurrent(),
                      version: QrVersions.auto,
                      size: 200.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
