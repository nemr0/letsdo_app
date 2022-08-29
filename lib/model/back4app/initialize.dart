import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:flutter/material.dart';

/// Initializes Back4App Instance
Future<void> initializeParse() async {
  const String keyApplicationId = 'EUe54YRk7TDZbb1VjuGxCqE6BXdGt4BweQYBjKNb';
  const String keyClient = '2OKZRNVbEUb2k8ioJLrlptQRe2eFWX2Vv9Qkttll';
  const String keyParseServerUrl = 'https://parseapi.back4app.com';
  await Parse()
      .initialize(keyApplicationId, keyParseServerUrl, clientKey: keyClient)
      .then((value) =>
          debugPrint('parse Initialized? ${value.hasParseBeenInitialized()}'));
}
