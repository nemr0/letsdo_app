import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cross_connectivity/cross_connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:letsdo_app/theme.dart';
import 'package:letsdo_app/view/screens/forgot_password.dart';
import 'package:letsdo_app/view/screens/home/home_body.dart';
import 'package:letsdo_app/view/screens/login.dart';
import 'package:letsdo_app/view/screens/signup.dart';
import 'package:letsdo_app/view/screens/today/today_view.dart';
import 'package:letsdo_app/view/screens/welcome.dart';
import 'package:letsdo_app/view/widgets/network_snack_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'controller/global_controllers_providers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  ///Allow Unlimited Caching for Firebase Firestore data
  FirebaseFirestore.instance.settings = const Settings(
      persistenceEnabled: true, cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);

  /// Using Firebase Emulators in Debug Mode
  // if (kDebugMode) {
  //   await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  // }

  runApp(
      // Provider Scope to Enable Riverpod's providers access all over the app
      const ProviderScope(child: MyApp()));
}

/// Entry [ConsumerWidget]
class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ConnectivityBuilder(builder:
        (BuildContext context, bool? isConnected, ConnectivityStatus? status) {
      final double height =
          MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height;
      final prev = ref.watch(wasOnline);
      if (prev.value == false && isConnected == true) {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          scaffoldMessengerKey.currentState?.clearSnackBars();
          scaffoldMessengerKey.currentState
              ?.showSnackBar(networkSnackBar(isOffline: false, height: height));
        });
      } else {
        if (isConnected == false) {
          SchedulerBinding.instance.addPostFrameCallback((_) {
            scaffoldMessengerKey.currentState?.showSnackBar(
                networkSnackBar(isOffline: true, height: height));
          });
        }
      }
      prev.toSomething(isConnected);
      final User? user = FirebaseAuth.instance.currentUser;
      return MaterialApp(
        scaffoldMessengerKey: scaffoldMessengerKey,
        debugShowCheckedModeBanner: false,
        title: 'Let\'s Do App!',
        themeMode: ThemeMode.dark,
        theme: ThemeOfLetsDo.lightTheme(),
        darkTheme: ThemeOfLetsDo.darkTheme(),
        initialRoute: user == null ? WelcomeOneScreen.id : HomeScreen.id,
        routes: {
          WelcomeOneScreen.id: (context) => const WelcomeOneScreen(),
          WelcomeTwoScreen.id: (context) => const WelcomeTwoScreen(),
          SignUpScreen.id: (context) => const SignUpScreen(),
          LoginScreen.id: (context) => const LoginScreen(),
          ForgotScreen.id: (context) => const ForgotScreen(),
          HomeScreen.id: (context) => const HomeScreen(),
          TodayScreen.id: (context) => const TodayScreen(),
        },
      );
    });
  }
}
