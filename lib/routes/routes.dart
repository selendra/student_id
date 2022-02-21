// variable for our route names
import 'package:flutter/material.dart';
import 'package:student_id/all_export.dart';

const String loginPage = 'login';
const String registerPage = 'registerPage';

// controller function with switch statement to control page route flow
Route<WidgetBuilder> controller(RouteSettings settings) {
  switch (settings.name) {
    case loginPage:
      return MaterialPageRoute(builder: (context) => const LoginPage());
    case registerPage:
      return MaterialPageRoute(builder: (context) => const RegisterPage());
    default:
      throw ('this route name does not exist');
  }
}
