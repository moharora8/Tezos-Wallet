import 'package:http/http.dart' as http;

String testAddress = 'tz1c4hy9Mcqm9cQ7GyZpkqzAFDVrWVY8ubs1';

Map<String, String> networks = {
  'Mainnet': 'api.tzkt.io',
  'Edo2net': 'api.edo2net.tzkt.io',
  'Florence Net': 'api.florencenet.tzkt.io'
};
Map<String, String> networksChains = {
  'Mainnet': 'https://mainnet.smartpy.io',
  'Edo2net': 'https://edonet.smartpy.io/',
  // 'Florence Net': 'api.florencenet.tzkt.io'
};
Future<http.Response> getAccountInfo(
  String network,
  String address,
) {
  var url = Uri.https(
      networks[network], '/v1/accounts/$address', {'metadata': 'true'});
  return http.get(url);
}

Future<http.Response> getAccountOperations(String network, String address) {
  var url = Uri.https(networks[network], '/v1/accounts/$address/operations');
  return http.get(url);
}
