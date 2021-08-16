import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'config.dart';
import 'state_management/appstate.dart';
import 'ui/pages/decider.dart';
import 'ui/pages/home.dart';
import 'ui/pages/landing.dart';
import 'plugins/tezster.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  TezoApp.sharedPreferences = await SharedPreferences.getInstance();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white, // transparent status bar
      statusBarIconBrightness: Brightness.dark // dark text for status bar
      ));
  TezsterDart.init();
  runApp(const MyApp());
}

// void main() {

// }

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: AppState.instance.updatesStream,
        builder: (context, snapshot) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: AppState.naviagtorKey,
            title: 'Tezos Wallet',
            theme: ThemeData(
                primaryIconTheme: IconThemeData(color: Colors.white),
                iconTheme: IconThemeData(color: Colors.white),
                buttonColor: Color.fromRGBO(56, 24, 65, 1),
                textTheme: TextTheme(
                    headline3: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lato',
                        color: Colors.white,
                        fontSize: 20),
                    bodyText2: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 20,
                      color: Color.fromRGBO(56, 24, 65, 1),
                    ),
                    bodyText1: TextStyle(
                        fontFamily: 'Lato',
                        color: Color.fromRGBO(56, 24, 65, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                    headline1: TextStyle(
                        fontFamily: 'OpenSans',
                        color: Color.fromRGBO(56, 24, 65, 1),
                        fontSize: 12),
                    headline2: TextStyle(
                        fontFamily: 'OpenSans',
                        color: Colors.white,
                        fontSize: 12),
                    headline4: TextStyle(
                        fontFamily: 'OpenSans',
                        color: Color.fromRGBO(56, 24, 65, 1),
                        fontSize: 16),
                    headline5: TextStyle(
                        fontFamily: 'OpenSans',
                        color: Colors.white,
                        fontSize: 14),
                    headline6: TextStyle(
                        fontFamily: 'OpenSans',
                        color: Colors.white,
                        fontSize: 17))),
            home: TezoApp.sharedPreferences.getString(TezoApp.accountCreated) ==
                        null ||
                    TezoApp.sharedPreferences
                        .getString(TezoApp.accountCreated)
                        .isEmpty
                ? Decider()
                : Home(),
          );
        });
  }
}
