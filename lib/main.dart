import 'package:flutter/material.dart';
import 'package:letsdo_app/theme.dart';
import 'package:letsdo_app/view/screens/login.dart';
import 'package:letsdo_app/view/screens/signup.dart';
import 'package:letsdo_app/view/screens/welcome.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const String keyApplicationId = 'EUe54YRk7TDZbb1VjuGxCqE6BXdGt4BweQYBjKNb';
  const String keyClient = '2OKZRNVbEUb2k8ioJLrlptQRe2eFWX2Vv9Qkttll';
  const String keyParseServerUrl = 'https://parseapi.back4app.com';
  await Parse()
      .initialize(keyApplicationId, keyParseServerUrl, clientKey: keyClient)
      .then((value) =>
          debugPrint('parse Initialized? ${value.hasParseBeenInitialized()}'));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Let\'s Do App!',
      themeMode: ThemeMode.light,
      theme: ThemeOfLetsDo.lightTheme(),
      darkTheme: ThemeOfLetsDo.darkTheme(),
      initialRoute: WelcomeOneScreen.id,
      routes: {
        WelcomeOneScreen.id: (context) => const WelcomeOneScreen(),
        WelcomeTwoScreen.id: (context) => const WelcomeTwoScreen(),
        SignUpScreen.id: (context) => const SignUpScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
      },
    );
  }
}
