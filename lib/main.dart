import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/core/app/flutter_starter_app.dart';
import 'package:flutter_starter/core/utils/instance_get_it.dart';

/// main for prod env
void main() {
  commonMain();
}

/// This file is not used by configurations
/// See main_*.dart for specific configurations files
Future<void> commonMain() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp();

  // initialize remote config service
  // await initialiseRemoteConfig();

  setupGetIt();

  // MBZ_STARTER_PORTRAIT_ONLY
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    const ProviderScope(
      child: ProveApp(),
    ),
  );
}
