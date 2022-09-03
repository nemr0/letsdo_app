import 'package:cross_connectivity/cross_connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:letsdo_app/model/back4app/initialize.dart';
import 'package:letsdo_app/theme.dart';
import 'package:letsdo_app/view/screens/forgot_password.dart';
import 'package:letsdo_app/view/screens/home.dart';
import 'package:letsdo_app/view/screens/login.dart';
import 'package:letsdo_app/view/screens/signup.dart';
import 'package:letsdo_app/view/screens/welcome.dart';
import 'package:letsdo_app/view/widgets/snackbars.dart';

import 'controller/global_controllers_providers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeParse();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MediaQuery(
      data: const MediaQueryData(),
      child: ConnectivityBuilder(builder: (BuildContext context,
          bool? isConnected, ConnectivityStatus? status) {
        final double height =
            WidgetsBinding.instance.window.physicalSize.height / 3;
        final prev = ref.watch(wasOnline);
        if (prev.value == false && isConnected == true) {
          SchedulerBinding.instance.addPostFrameCallback((_) {
            scaffoldMessengerKey.currentState?.clearSnackBars();
            scaffoldMessengerKey.currentState
                ?.showSnackBar(conSnackBar(isOffline: false, height: height));
          });
        } else {
          if (isConnected == false) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              scaffoldMessengerKey.currentState
                  ?.showSnackBar(conSnackBar(isOffline: true, height: height));
            });
          }
        }
        prev.toSomething(isConnected);
        return MaterialApp(
          scaffoldMessengerKey: scaffoldMessengerKey,
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
      }),
    );
  }
}
