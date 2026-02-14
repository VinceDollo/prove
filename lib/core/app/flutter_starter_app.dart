import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/app/go_routes.dart';
import 'package:flutter_starter/generated/l10n.dart';
import 'package:flutter_starter/managers/remote_config_helper.dart';
import 'package:flutter_starter/values/themes.dart';

class FlutterStarterApp extends StatefulWidget {
  const FlutterStarterApp({Key? key}) : super(key: key);

  @override
  FlutterStarterAppState createState() => FlutterStarterAppState();
}

class FlutterStarterAppState extends State<FlutterStarterApp>
    with WidgetsBindingObserver {
  final _remoteConfig = ValueNotifier<bool>(true);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      FirebaseRemoteConfig.instance.fetchAndActivate().then(
            (_) => FirebaseRemoteConfig.instance
                .check()
                .then((value) => _remoteConfig.value = value),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, watch, __) => ValueListenableBuilder(
        valueListenable: _remoteConfig,
        builder: (_, __, ___) {

          return MaterialApp.router(
            routerConfig: router,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme(),
            themeMode: ThemeMode.light,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              DefaultCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            title: "Nom de l'application",
          );
        },
      ),
    );
  }
}
