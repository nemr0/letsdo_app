import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';

///Username [TextEditingController] [Provider]
final usernameControllerProvider = Provider((ref) => TextEditingController());

///Password [TextEditingController] [Provider]
final pwdControllerProvider = Provider((ref) => TextEditingController());

///Email [TextEditingController] [Provider]
final emailControllerProvider = Provider((ref) => TextEditingController());
