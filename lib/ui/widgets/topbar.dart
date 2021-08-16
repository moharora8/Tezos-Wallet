import 'package:flutter/material.dart';
import '../../Networking/networking.dart';
import '../../state_management/appstate.dart';

class TopBar extends StatefulWidget {
  const TopBar({Key key}) : super(key: key);

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DropdownButtonHideUnderline(
              child: DropdownButton(
                  style: TextStyle(fontSize: 16),
                  value: AppState.instance.selectedNetwork,
                  items: networks.keys
                      .map((e) => DropdownMenuItem(
                            child: Text(
                              e,
                              style: TextStyle(color: Colors.black),
                            ),
                            value: e,
                          ))
                      .toList(),
                  onChanged: (value) {
                    AppState.instance.selectedNetwork = value;
                    AppState.instance.refreshAccounts();
                  }),
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton(
                  // style: TextStyle(color: Colors.black),
                  value: AppState.instance.selectedAccount,
                  items: [
                    for (int i = 0; i < AppState.instance.accounts.length; i++)
                      DropdownMenuItem(
                        child: Text('Account ${i + 1}'),
                        value: i,
                      )
                  ],
                  onChanged: (value) {
                    // AppState.instance.changeSelectedNetwork(value);
                    AppState.instance.selectedAccount = value;
                    AppState.instance.refreshAccounts();
                  }),
            ),
            TextButton(
                onPressed: AppState.instance.refreshAccounts,
                child: Text(
                  'Refresh',
                  style: TextStyle(color: Colors.deepPurple[300]),
                )),
          ],
        ),
      ),
    );
  }
}
