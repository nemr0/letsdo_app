import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:letsdo_app/model/back4app/initialize.dart';
import 'package:letsdo_app/theme.dart';
import 'package:letsdo_app/view/screens/forgot_password.dart';
import 'package:letsdo_app/view/screens/home.dart';
import 'package:letsdo_app/view/screens/login.dart';
import 'package:letsdo_app/view/screens/signup.dart';
import 'package:letsdo_app/view/screens/welcome.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeParse();
  runApp(const ProviderScope(child: MyApp()));
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
      themeMode: ThemeMode.system,
      theme: ThemeOfLetsDo.lightTheme(),
      darkTheme: ThemeOfLetsDo.darkTheme(),
      initialRoute: WelcomeOneScreen.id,
      routes: {
        WelcomeOneScreen.id: (context) => const WelcomeOneScreen(),
        WelcomeTwoScreen.id: (context) => const WelcomeTwoScreen(),
        SignUpScreen.id: (context) => const SignUpScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        ForgotScreen.id: (context) => const ForgotScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
      },
    );
  }
}
