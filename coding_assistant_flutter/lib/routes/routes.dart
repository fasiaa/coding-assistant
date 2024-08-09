import 'package:flutter/material.dart';
import '../ui/home_screen/home_screen.dart';
import 'routes_names.dart';

class Routes {
  static MaterialPageRoute generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.homescreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const HomeScreen(),
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
