import 'package:shared_preferences/shared_preferences.dart';

class TezoApp {
  // App Information
  static const String appName = 'tezos wallet';
  // Firestore
  static SharedPreferences sharedPreferences;
  // User Detail
  static final String userName = 'name';
  static const String accountCreated = 'accountCreated';
  static final String userWallet = 'wallet';
  static final String userPhone = 'phonenumber';
}
