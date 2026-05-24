import 'package:flutter/material.dart';


extension Navigation on BuildContext {
  // 🔹 يفتح شاشة جديدة باستخدام اسم route
  // المستخدم يقدر يرجع للشاشة اللي قبلها (push عادي)
  Future<T?> pushNamed<T>(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed<T>(routeName, arguments: arguments);
  }

  // 🔹 يفتح شاشة جديدة باستخدام Route مباشرة (مش named)
  // مفيد لو عايز تبعت widget أو تعمل custom navigation
  Future<T?> pushRoute<T>(Route<T> route) {
    return Navigator.of(this).push(route);
  }

  // 🔹 يفتح شاشة جديدة ويشيل الشاشة الحالية من الـ stack
  // المستخدم مش هيقدر يرجع للشاشة اللي قبلها
  // مفيد في (login → home / splash → login)
  Future<T?> pushReplacementNamed<T>(String routeName, {Object? arguments}) {
    return Navigator.of(
      this,
    ).pushReplacementNamed<T, T>(routeName, arguments: arguments);
  }

  // 🔹 نفس اللي فوق لكن باستخدام Route بدل name
  Future<T?> pushReplacement<T>(Route<T> route) {
    return Navigator.of(this).pushReplacement(route);
  }

  // 🔹 يفتح شاشة جديدة ويمسح كل الـ history (navigation stack)
  // المستخدم مش هيقدر يرجع لأي شاشة قبلها
  // مهم جدًا في (login / logout flows)
  Future<T?> pushNamedAndRemoveUntil<T>(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamedAndRemoveUntil<T>(
      routeName,
          (route) => false,
      arguments: arguments,
    );
  }

  // 🔹 يرجع خطوة واحدة لورا (back)
  // بيعمل check عشان يتجنب crash لو مفيش حاجة يرجع لها
  void pop() {
    final navigator = Navigator.of(this);
    if (navigator.canPop()) {
      navigator.pop();
    }
  }

  // 🔹 يرجع للشاشة السابقة ومعاه data (result)
  // مفيد في forms أو اختيار عنصر
  void popWithResult<T>([T? result]) {
    Navigator.of(this).pop(result);
  }

  // 🔹 يرجع لحد ما يوصل لشاشة معينة بالاسم
  // ولو ملقاش الاسم، بيرجع لأول شاشة (isFirst)
  // مفيد في flows طويلة
  void popUntil(String routeName) {
    Navigator.of(
      this,
    ).popUntil((route) => route.settings.name == routeName || route.isFirst);
  }
}







extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this == "";
}
