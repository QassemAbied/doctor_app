import 'package:flutter/material.dart';

extension Navigition on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments,  }) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName,RoutePredicate predicate,  {Object? arguments}) {
    return Navigator.of(
      this,
    ).pushNamedAndRemoveUntil(routeName,predicate, arguments: arguments);
  }
  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushReplacementNamed(routeName, arguments: arguments);
  }
 void navigatorPop() {
    return Navigator.of(this).pop();
  }

}

extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this == "";
}
