import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

Future<ParseResponse> register(
    {required String? email,
    required String? password,
    required String? username}) async {
  final user = ParseUser(username, password, email);
  ParseResponse response = await user.create();
  return response;
}
