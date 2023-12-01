import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trips/core/routes/app_routes.dart';
import 'package:trips/core/routes/scaffold_with_nested_nav.dart';
import 'package:trips/features/auth/presentation/login_page.dart';
import 'package:trips/features/trips/presentaion/pages/trips_search_page.dart';
import 'package:trips/splash_screen.dart';

final rootNavKey = GlobalKey<NavigatorState>();
final shellNavKeyTripsSearch = GlobalKey<NavigatorState>();
final shellNavKeyCreate = GlobalKey<NavigatorState>();
final shellNavKeyTrips = GlobalKey<NavigatorState>();
final shellNavKeyInfo = GlobalKey<NavigatorState>();
final shellNavKeyProfile = GlobalKey<NavigatorState>();

final goRouter = GoRouter(
  initialLocation: AppRoutes.splashScreen,
  navigatorKey: rootNavKey,
  routes: [
    GoRoute(
      path: AppRoutes.splashScreen,
      builder: (context, state) {
        return const SplashScreen();
      },
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: shellNavKeyTripsSearch,
          routes: [
            GoRoute(
              path: AppRoutes.tripsSearchPage,
              pageBuilder: (context, state) {
                return const NoTransitionPage(child: TripsSearchPage());
              },
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: shellNavKeyCreate,
          routes: [
            GoRoute(
              path: AppRoutes.createPage,
              pageBuilder: (context, state) {
                return NoTransitionPage(
                  child: Container(),
                );
              },
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: shellNavKeyTrips,
          routes: [
            GoRoute(
              path: AppRoutes.tripsPageScreen,
              pageBuilder: (context, state) {
                return NoTransitionPage(
                  child: Container(),
                );
              },
            )
          ],
        ),
        StatefulShellBranch(
          navigatorKey: shellNavKeyProfile,
          routes: [
            GoRoute(
              path: AppRoutes.profilePage,
              pageBuilder: (context, state) {
                return NoTransitionPage(
                  child: Container(),
                );
              },
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: AppRoutes.loginPage,
      builder: (context, state) {
        return const LoginPage();
      },
    ),
  ],
);
