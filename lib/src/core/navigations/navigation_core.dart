// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

abstract class Navigation {
  void push<T>(String path, {T? arguments});

  void pop();

  void replaceAll<T>(String path, {T? arguments});

  void replace<T>(String path, {T? arguments});

  void popUntilPath(String path);

  bool canPop();
}

class NavigationImpl implements Navigation {
  @override
  void pop() => Get.back();

  @override
  void push<T>(String path, {T? arguments}) =>
      Get.toNamed(path, arguments: arguments);

  @override
  void replaceAll<T>(String path, {T? arguments}) =>
      Get.offAllNamed(path, arguments: arguments);

  @override
  void replace<T>(String path, {T? arguments}) =>
      Get.offNamed(path, arguments: arguments);

  @override
  void popUntilPath(String path) =>
      Get.context != null
          ? Navigator.of(
            Get.context!,
          ).popUntil((Route<dynamic> route) => route.settings.name == path)
          : null;

  @override
  bool canPop() =>
      Get.context != null ? Navigator.of(Get.context!).canPop() : false;
}
