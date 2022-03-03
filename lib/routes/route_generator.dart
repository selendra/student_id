// variable for our route names
import 'package:flutter/material.dart';
import 'package:student_id/all_export.dart';

const String loginRoute = '/';
const String navbarRoute = 'navbar';
const String verifyRoute = 'verify';
const String setupRoute = 'setup';
const String createWalletRoute = 'createWallet';
const String verifyWaletRoute = 'verifyWallet';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case navbarRoute:
        return MaterialPageRoute(builder: (_) => const Navbar());
      case verifyRoute:
        return MaterialPageRoute(builder: (_) => const VerifyPage());
      case setupRoute:
        return MaterialPageRoute(builder: (_) => const SetupPage());
      case createWalletRoute:
        return MaterialPageRoute(builder: (_) => const CreateWalletPage());
      case verifyWaletRoute:
        return MaterialPageRoute(builder: (_) => const VerifyPassphrase());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
