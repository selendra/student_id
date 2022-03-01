// variable for our route names
import 'package:flutter/material.dart';
import 'package:student_id/all_export.dart';

const String loginRoute = '/';
const String navbarRoute = 'navbar';
const String verifyRoute = 'verify';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case navbarRoute:
        return MaterialPageRoute(builder: (_) => const Navbar());
      case verifyRoute:
        return MaterialPageRoute(builder: (_) => const VerifyPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
