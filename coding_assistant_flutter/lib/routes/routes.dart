import 'package:coding_assistant_flutter/ui/chat_screen/chat_screen.dart';
import 'package:coding_assistant_flutter/ui/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import '../ui/home_screen/home_screen.dart';
import '../ui/signup_screen.dart/signup_screen.dart';
import 'routes_names.dart';

class Routes {
  static MaterialPageRoute generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.loginscreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const LoginScreen(),
        );

      case RoutesName.signup:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SignUpScreen(),
        );

      case RoutesName.homescreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const HomeScreen(),
        );

      case RoutesName.chatscreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const ChatScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) {
            return const Scaffold(
              body: Center(
                child: Text('No Route Selected'),
              ),
            );
          },
        );
    }
  }
}
