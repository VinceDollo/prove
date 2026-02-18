import 'package:flutter/material.dart';
import 'package:flutter_starter/features/home/presentation/screens/home_screen.dart';
import 'package:flutter_starter/features/home/presentation/screens/main_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/${Screen1.routeName}',
  redirect: (context, state) {
    return null;
  },
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return MainScreen(
          initialTabsLastPath: const [
            '/${Screen1.routeName}',
            // '/${Screen2.routeName}',
            // '/${Screen3.routeName}',
            // '/${Screen4.routeName}',
            // '/${Screen5.routeName}',
          ],
          child: child,
        );
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              name: Screen1.routeName,
              path: '/${Screen1.routeName}',
              builder: (context, state) {
                return const Screen1();
              },
            ),
          ],
        ),
        // StatefulShellBranch(
        //   routes: [
        //     // GoRoute(
        //     //   path: '/${Screen2.routeName}',
        //     //   builder: (context, state) {
        //     //     return const Screen2();
        //     //   },
        //     // ),
        //   ],
        // ),
        // StatefulShellBranch(
        //   routes: [
        //     // GoRoute(
        //     //   path: '/${Screen3.routeName}',
        //     //   builder: (context, state) {
        //     //     return const Screen3();
        //     //   },
        //     // ),
        //   ],
        // ),
        // StatefulShellBranch(
        //   routes: [
        //     // GoRoute(
        //     //   path: '/${Screen4.routeName}',
        //     //   builder: (context, state) {
        //     //     return const Screen4();
        //     //   },
        //     // ),
        //   ],
        // ),
        // StatefulShellBranch(
        //   routes: [
        //     // GoRoute(
        //     //   path: '/${Screen5.routeName}',
        //     //   builder: (context, state) {
        //     //     return const Screen5();
        //     //   },
        //     // ),
        //   ],
        // ),
      ],
    ),
  ],
);
