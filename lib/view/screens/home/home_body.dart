import 'package:flutter/material.dart';
import 'package:letsdo_app/model/firebase/get.dart';

import '../../widgets/appbar.dart';
import '../../widgets/buttons/todo_list_button.dart';
import '../../widgets/drawer/drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const id = '/home';

  @override
  Widget build(BuildContext context) {
    FBGet().email('nemr');
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: buildAppBar('Home', context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.start,
            children: const [
              TodoListButton(
                icon: Icons.store,
                text: 'Store',
              ),
              TodoListButton(icon: Icons.work, text: 'School'),
              TodoListButton(),
              // TextButton(
              //     onPressed: () => logout(context), child: const Text('logout'))
            ],
          ),
        ),
      ),
    );
  }
}
