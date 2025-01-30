import 'package:flutter/material.dart';

class RoutingMiddleware extends NavigatorObserver {

  final Function(Route<dynamic>?, Route<dynamic>?)? onNavigationAttempt;
  RoutingMiddleware({this.onNavigationAttempt});

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    onNavigationAttempt?.call(route, previousRoute);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    onNavigationAttempt?.call(newRoute, oldRoute);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    onNavigationAttempt?.call(route, previousRoute);
  }

}