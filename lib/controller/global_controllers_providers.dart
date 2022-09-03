import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/bool_provider.dart';

final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
final wasOnline =
    Provider<BoolProvider>((ref) => BoolProvider(true, 'wasOnline'));
