import 'package:flutter/material.dart';
import 'dart:developer';

typedef OnNavigationAttemptCallback = String? Function(String? routeName);

class AppRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  final OnNavigationAttemptCallback? onNavigationAttempt;

  AppRouteObserver({this.onNavigationAttempt});

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    _handleNavigation(route);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute != null) {
      _handleNavigation(newRoute);
    }
  }

  void _handleNavigation(Route route) {
    if (route is PageRoute) {
      final redirectedRoute = onNavigationAttempt?.call(route.settings.name);
      if (redirectedRoute != null && redirectedRoute != route.settings.name) {
        log('Redirecting to $redirectedRoute from ${route.settings.name}');
        Navigator.of(route.navigator!.context).pushReplacementNamed(redirectedRoute);
      }
    }
  }
}
