import 'package:flutter/material.dart';
import 'package:letsdo_app/theme.dart';
import 'package:letsdo_app/view/screens/login.dart';
import 'package:letsdo_app/view/screens/signup.dart';
import 'package:letsdo_app/view/screens/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
