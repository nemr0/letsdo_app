import 'package:flutter/material.dart';
import 'package:letsdo_app/action/on_logout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const id = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child:
                    Text('Home', style: Theme.of(context).textTheme.labelLarge),
              ),
              TextButton(
                  onPressed: () => logout(context), child: const Text('logout'))
            ],
          ),
        ),
      ),
    );
  }
}
