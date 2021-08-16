import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../state_management/appstate.dart';
import '../pages/import_account.dart';
import '../pages/receive_page.dart';
import '../pages/send_transation.dart';
import '../widgets/landing_page/operationview.dart';
import '../widgets/landing_page/transaction_buttons.dart';
import '../widgets/topbar.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
    AppState.instance.init();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).buttonColor,
            centerTitle: true,
            title: Text(
              'Tezos Wallet',
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 8,
                ),
                TopBar(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Address',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Clipboard.setData(ClipboardData(
                              text: AppState.instance
                                  .getAccountAddressCurrent()));
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Copied To clipboard')));
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              border:
                                  Border.all(color: Colors.deepPurple[300])),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              AppState.instance.getAccountAddressCurrent(),
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
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(color: Colors.deepPurple[300])),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TransactionButton(
                                icon: Icons.arrow_upward,
                                text: 'Send',
                                onClick: _handleSend),
                            TransactionButton(
                              icon: Icons.qr_code,
                              text: 'Receive',
                              onClick: _handleReceive,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Center(
                    child: Text(
                  'Operations',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                )),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: Divider(
                    color: Colors.deepPurpleAccent[200],
                  ),
                ),
                OperationsView(),
              ],
            ),
          )),
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
}
