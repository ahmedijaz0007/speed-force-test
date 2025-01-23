import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/feature1':
        return MaterialPageRoute(builder: (_) => const Feature1Screen());
      default:
        return MaterialPageRoute(builder: (_) => const NotFoundScreen());
    }
  }
}