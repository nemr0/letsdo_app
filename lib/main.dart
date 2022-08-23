import 'package:flutter/material.dart';
import 'package:letsdo_app/theme.dart';
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
      themeMode: ThemeMode.system,
      theme: ThemeOfLetsDo.lightTheme(),
      darkTheme: ThemeOfLetsDo.darkTheme(),
      initialRoute: WelcomeOneScreen.id,
      routes: {
        WelcomeOneScreen.id: (context) => const WelcomeOneScreen(),
        WelcomeTwoScreen.id: (context) => const WelcomeTwoScreen(),
      },
    );
  }
}
