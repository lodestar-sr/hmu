import 'package:flutter/material.dart';
import 'package:hmu/core/Routes/routes.dart';
import 'package:hmu/features/splash/presentation/gate_page.dart';
import 'package:hmu/features/splash/presentation/splash_page.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(builder: (_) => SplashPage());
      case gateRoute:
        return MaterialPageRoute(builder: (_) => GatePage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
