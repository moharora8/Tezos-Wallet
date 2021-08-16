import 'package:devfest_tezos/Networking/networking.dart';
import 'package:devfest_tezos/state_management/appstate.dart';
import 'package:devfest_tezos/ui/pages/send_transation.dart';
import 'package:devfest_tezos/ui/widgets/landing_page/operationview.dart';
import 'package:devfest_tezos/ui/widgets/landing_page/transaction_buttons.dart';
import 'package:devfest_tezos/ui/widgets/topbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../config.dart';
import 'decider.dart';
import 'receive_page.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool showOptions = false;
  @override
  void initState() {
    super.initState();
    AppState.instance.init();
  }

  @override
  Widget build(BuildContext context) {
    var _screensize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
                color: Theme.of(context).buttonColor,
                height: 55,
                padding: EdgeInsets.fromLTRB(20, 5, 0, 0),
                child: Row(
                  children: [
                    Text(
                      'Tezos Wallet',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    SizedBox(width: 30),
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            DropdownButtonHideUnderline(
                              child: DropdownButton(
                                  dropdownColor: Theme.of(context).buttonColor,
                                  isDense: true,
                                  style: TextStyle(color: Colors.black),
                                  value: AppState.instance.selectedAccount,
                                  items: [
                                    for (int i = 0;
                                        i < AppState.instance.accounts.length;
                                        i++)
                                      DropdownMenuItem(
                                        child: Text(
                                          'Account ${i + 1}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5,
                                        ),
                                        value: i,
                                      )
                                  ],
                                  onChanged: (value) {
                                    // AppState.instance.changeSelectedNetwork(value);
                                    AppState.instance.selectedAccount = value;
                                    AppState.instance.refreshAccounts();
                                  }),
                            ),
                            SizedBox(height: 2),
                            DropdownButtonHideUnderline(
                              child: DropdownButton(
                                  dropdownColor: Theme.of(context).buttonColor,
                                  isDense: true,
                                  value: AppState.instance.selectedNetwork,
                                  items: networks.keys
                                      .map((e) => DropdownMenuItem(
                                            child: Text(
                                              e,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline5,
                                            ),
                                            value: e,
                                          ))
                                      .toList(),
                                  onChanged: (value) {
                                    AppState.instance.selectedNetwork = value;
                                    AppState.instance.refreshAccounts();
                                  }),
                            ),
                          ],
                        ),
                        SizedBox(width: 5),
                        InkWell(
                          onTap: () {
                            // setState(() {
                            //   showOptions = !showOptions;
                            // });
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return SimpleDialog(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        //margin: EdgeInsets.only(right: 20),
                                        height: 250,
                                        width: 250,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                            color:
                                                Theme.of(context).buttonColor),
                                        child: Column(
                                          children: [
                                            InkWell(
                                              onTap: () async {
                                                print('Tapped');
                                                await TezoApp.sharedPreferences
                                                    .setString(
                                                        TezoApp.accountCreated,
                                                        '');
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Decider()));
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                      'Account ${AppState.instance.selectedAccount + 1}',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline6),
                                                  SizedBox(
                                                    width: 40,
                                                  ),
                                                  InkWell(
                                                    onTap: () async {
                                                      print('Tapped');
                                                      await TezoApp
                                                          .sharedPreferences
                                                          .setString(
                                                              TezoApp
                                                                  .accountCreated,
                                                              '');
                                                      Navigator.pushReplacement(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      Decider()));
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          border: Border.all(
                                                              color:
                                                                  Colors.white,
                                                              width: 2)),
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      child: Text('Log Out',
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .headline6),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                                height: 1,
                                                color: Colors.white,
                                                margin: EdgeInsets.fromLTRB(
                                                    10, 5, 10, 5)),
                                            SizedBox(height: 5),
                                            Container(
                                              padding: EdgeInsets.all(5),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Icon(Icons.add),
                                                      SizedBox(width: 15),
                                                      Text('Create Account',
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .headline6)
                                                    ],
                                                  ),
                                                  SizedBox(height: 10),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                          Icons.download_sharp),
                                                      SizedBox(width: 15),
                                                      Text('Import Account',
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .headline6)
                                                    ],
                                                  ),
                                                  SizedBox(height: 10),
                                                  Row(
                                                    children: [
                                                      Icon(Icons.settings),
                                                      SizedBox(width: 15),
                                                      Text('Settings',
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .headline6)
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                });
                          },
                          child: Container(
                            margin: EdgeInsets.all(2),
                            child: Image.asset('assets/avatar.jpg',
                                fit: BoxFit.cover),
                            decoration: BoxDecoration(
                              //color: Colors.amber,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: 55,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                color: Theme.of(context).buttonColor,
                height: 10,
              ),
              Container(
                  padding: EdgeInsets.all(15),
                  height: 2,
                  width: _screensize.width,
                  color: Colors.black26),
              RefreshIndicator(
                color: Theme.of(context).buttonColor,
                onRefresh: () async {
                  await AppState.instance.refreshAccounts();
                },
                child: Container(
                  height: _screensize.height * 0.9,
                  width: _screensize.width,
                  // margin:EdgeInsets
                  child: ListView(
                    children: [
                      // TopBar(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Address',
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                            GestureDetector(
                              onTap: () {
                                Clipboard.setData(ClipboardData(
                                    text: AppState.instance
                                        .getAccountAddressCurrent()));
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text('Copied To clipboard')));
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                padding:
                                    const EdgeInsets.fromLTRB(10, 10, 0, 10),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    border: Border.all(
                                        color: Theme.of(context).buttonColor)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    AppState.instance
                                        .getAccountAddressCurrent(),
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Balance',
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                vertical: 10,
                              ),
                              padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  border: Border.all(
                                      color: Theme.of(context).buttonColor)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Image.asset(
                                      'assets/tez.png',
                                      height: 24,
                                      width: 24,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '${AppState.instance.getBalanceAccountCurrent()} Tez',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: _handleSend,
                                  child: _buildCategoryCard(
                                      bgColor: Theme.of(context).buttonColor,
                                      iconColor: Colors.white,
                                      iconData: Icons.send,
                                      text: "Send"),
                                ),
                                InkWell(
                                  onTap: _handleReceive,
                                  child: _buildCategoryCard(
                                      bgColor: Theme.of(context).buttonColor,
                                      iconColor: Colors.white,
                                      iconData: Icons.qr_code,
                                      text: "Receive"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                        child: Row(
                          children: [
                            Text(
                              'Transactions',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            Spacer(),
                            Text(
                              'See All',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.all(15),
                          height: 2,
                          width: _screensize.width,
                          color: Colors.black26),
                      OperationsView(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _handleSend() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => SendTransactionPage()));
  }

  _handleReceive() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ReceivePage()));
  }

  Column _buildCategoryCard(
      {Color bgColor, Color iconColor, IconData iconData, String text}) {
    return Column(
      children: <Widget>[
        Container(
          height: 65,
          width: 120,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Icon(
            iconData,
            color: iconColor,
            size: 36,
          ),
        ),
        SizedBox(height: 8),
        Text(text),
      ],
    );
  }
}
