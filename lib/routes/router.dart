import 'package:flutter/material.dart';
import 'package:speedforcetest/screens/sign_up_screen.dart';

import '../screens/login_screen.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) =>   LoginScreen());
       case '/SignUp':
         return MaterialPageRoute(builder: (_) =>  SignUpScreen());
      // default:
      //   return MaterialPageRoute(builder: (_) => const NotFoundScreen());
    }
  }
}

