import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

final loginFormKey = Provider<GlobalKey<FormState>>((ref) {
  final key = GlobalKey<FormState>();
  ref.onDispose(() => key.currentState?.reset());
  return key;
});
final registerFormKey = Provider<GlobalKey<FormState>>((ref) {
  final key = GlobalKey<FormState>();
  ref.onDispose(() => key.currentState?.reset());
  return key;
});
final forgotFormKey = Provider<GlobalKey<FormState>>((ref) {
  final key = GlobalKey<FormState>();
  ref.onDispose(() => key.currentState?.reset());
  return key;
});
// Forgot Screen Button Controller
final forgotBtnController =
    Provider.autoDispose<RoundedLoadingButtonController>(
        (ref) => RoundedLoadingButtonController());
final loginBtnController = Provider.autoDispose<RoundedLoadingButtonController>(
    (ref) => RoundedLoadingButtonController());
final registerBtnController =
    Provider.autoDispose<RoundedLoadingButtonController>(
        (ref) => RoundedLoadingButtonController());

///Username [TextEditingController] [Provider]
final nameControllerProvider = Provider.autoDispose<TextEditingController>(
    (ref) => TextEditingController());

///Password [TextEditingController] [Provider]
final pwdControllerProvider = Provider.autoDispose<TextEditingController>(
    (ref) => TextEditingController());

///Email [TextEditingController] [Provider]
final emailOrUsernameCtrProvider = Provider.autoDispose<TextEditingController>(
    (ref) => TextEditingController());
