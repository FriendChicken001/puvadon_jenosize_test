// Flutter imports:
import 'package:flutter/material.dart';

class RouteTrackingObserver extends NavigatorObserver {
  factory RouteTrackingObserver() => instance;

  RouteTrackingObserver._internal();

  static final RouteTrackingObserver instance =
      RouteTrackingObserver._internal();

  final List<String> routeStack = [];

  @override
  void didPush(Route route, Route? previousRoute) {
    final name = route.settings.name;
    if (name != null) {
      routeStack.add(name);
    }
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    final name = route.settings.name;
    if (name != null) {
      routeStack.remove(name);
    }
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    final name = newRoute?.settings.name;
    if (name != null) {
      routeStack.remove(name);
      routeStack.add(name);
    }
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    final name = route.settings.name;
    if (name != null) {
      routeStack.remove(name);
    }
  }

  @override
  void didStartUserGesture(Route route, Route? previousRoute) {
    final name = route.settings.name;
    if (name != null) {
      routeStack.add(name);
    }
  }

  @override
  void didStopUserGesture() {
    if (routeStack.isNotEmpty) {
      routeStack.removeLast();
    }
  }
}
