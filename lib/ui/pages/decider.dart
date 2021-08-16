import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../state_management/appstate.dart';

import '../pages/receive_page.dart';
import '../pages/send_transation.dart';
import '../widgets/landing_page/operationview.dart';
import '../widgets/landing_page/transaction_buttons.dart';
import '../widgets/topbar.dart';
import 'create/pass.dart';
import 'import/import.dart';

class Decider extends StatefulWidget {
  const Decider({Key key}) : super(key: key);

  @override
  State<Decider> createState() => _DeciderState();
}

class _DeciderState extends State<Decider> {
  @override
  void initState() {
    super.initState();
    //AppState.instance.init();
  }

  @override
  Widget build(BuildContext context) {
    var _screensize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backwardsCompatibility: false,
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
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ImportAccount()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(15),
                      width: _screensize.width * 0.7,
                      height: _screensize.height * 0.25,
                      decoration: BoxDecoration(
                        color: Theme.of(context).buttonColor,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Icon(Icons.alarm),
                          SizedBox(
                            height: 5,
                          ),
                          Text('Import Existing Wallet',
                              style: Theme.of(context).textTheme.headline3),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Lorem Ipsum Lorem Ipsum Lorem IpsumLorem Ipsum Lorem Ipsum',
                            style: Theme.of(context).textTheme.headline2,
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 35),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Pass()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(15),
                      width: _screensize.width * 0.7,
                      height: _screensize.height * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(
                            color: Theme.of(context).buttonColor, width: 3),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Icon(Icons.alarm,
                              color: Theme.of(context).buttonColor),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Create a new Wallet',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Lorem Ipsum Lorem Ipsum Lorem IpsumLorem Ipsum Lorem Ipsum',
                            style: Theme.of(context).textTheme.headline1,
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
