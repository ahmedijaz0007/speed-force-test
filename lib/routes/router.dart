import 'package:flutter/material.dart';
import 'package:speedforcetest/routes/app_routes.dart';
import 'package:speedforcetest/screens/dashboard_screen.dart';
import 'package:speedforcetest/screens/sign_up_screen.dart';

import '../screens/login_screen.dart';
import '../screens/profile_screen.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.initial:
        return MaterialPageRoute(builder: (_) =>   DashBoardScreen());
       case AppRoutes.signUp:
         return MaterialPageRoute(builder: (_) =>  SignUpScreen());
      case AppRoutes.DashBoardScreen:
        return MaterialPageRoute(builder: (_) =>  DashBoardScreen());
      case AppRoutes.profile:
        return MaterialPageRoute(builder: (_) =>  ProfileScreen());
      // default:
      //   return MaterialPageRoute(builder: (_) => const NotFoundScreen());
    }
  }
}

