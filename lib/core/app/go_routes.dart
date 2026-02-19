import 'package:flutter/material.dart';
import 'package:flutter_starter/features/design/design_screen.dart';
import 'package:flutter_starter/features/home/presentation/home_screen.dart';
import 'package:flutter_starter/features/main_screen.dart';
import 'package:flutter_starter/features/settings/presentation/settings_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/${HomeScreen.routeName}',
  redirect: (context, state) {
    return null;
  },
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return MainScreen(
          initialTabsLastPath: const [
            '/${HomeScreen.routeName}',
            '/${SettingsScreen.routeName}',
            '/${DesignScreen.routeName}',
          ],
          child: child,
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: HomeScreen.routeName,
              path: '/${HomeScreen.routeName}',
              builder: (context, state) {
                return const HomeScreen();
              },
            ),
            GoRoute(
              name: SettingsScreen.routeName,
              path: '/${SettingsScreen.routeName}',
              builder: (context, state) {
                return const SettingsScreen();
              },
            ),
            GoRoute(
              name: DesignScreen.routeName,
              path: '/${DesignScreen.routeName}',
              builder: (context, state) {
                return const DesignScreen();
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
