import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

Future<void> animateFailureBtn(
    {required AutoDisposeProvider<RoundedLoadingButtonController>? btn,
    required Reader read}) async {
  final btnCo = read(btn!);
  btnCo.error();
  await Future.delayed(const Duration(milliseconds: 400));
  // await showNoInternet(context: context);
  btnCo.stop();
}

Future<void> animateSuccessBtn(
    {required AutoDisposeProvider<RoundedLoadingButtonController>? btn,
    required Reader read}) async {
  await Future.delayed(Duration.zero);
  final btnCo = read(btn!);
  btnCo.success();
  await Future.delayed(const Duration(milliseconds: 400));
  // await showNoInternet(context: context);
  btnCo.stop();
}
