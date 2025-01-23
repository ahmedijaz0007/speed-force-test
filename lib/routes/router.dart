import 'package:flutter/material.dart';

import '../screens/login_screen.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) =>   LoginScreen());
      // case '/feature1':
      //   return MaterialPageRoute(builder: (_) => const Feature1Screen());
      // default:
      //   return MaterialPageRoute(builder: (_) => const NotFoundScreen());
    }
  }
}

