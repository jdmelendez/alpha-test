import 'package:alpha_test/presentation/lecturas/lecturasHistorico_screen.dart';
import 'package:alpha_test/presentation/home_scren.dart';
import 'package:alpha_test/presentation/scaner/scaner_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const _pageKey = ValueKey('_pageKey');
const _scaffoldKey = ValueKey('_scaffoldKey');

const String home_route = "/home";
const String scaner_route = "/scaner";
const String lecturasHistorico_route = "/lecturasHistorico";

// private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: home_route,
    routerNeglect: true,
    routes: [
      //*  PUBLIC
      GoRoute(
        path: home_route,
        name: home_route,
        pageBuilder: (context, state) => CustomTransitionPage<void>(
          key: ValueKey<String>(state.matchedLocation +
              DateTime.now().millisecondsSinceEpoch.toString()),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
          child: HomeScreen(),
        ),
      ),
      GoRoute(
        path: scaner_route,
        name: scaner_route,
        pageBuilder: (context, state) => CustomTransitionPage<void>(
          key: ValueKey<String>(state.matchedLocation +
              DateTime.now().millisecondsSinceEpoch.toString()),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
          child: ScanerScreen(),
        ),
      ),
      GoRoute(
        path: lecturasHistorico_route,
        name: lecturasHistorico_route,
        pageBuilder: (context, state) => CustomTransitionPage<void>(
          key: ValueKey<String>(state.matchedLocation +
              DateTime.now().millisecondsSinceEpoch.toString()),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            );
          },
          child: LecturasHistoricoScreen(),
        ),
      ),
    ]);
