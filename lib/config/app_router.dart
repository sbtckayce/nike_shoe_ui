import 'package:flutter/material.dart';
import 'package:shoe_app/models/models.dart';

import 'package:shoe_app/screens/screens.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return LoginScreen.route();
      case '/':
        return HomeScreen.route();
      case '/detail':
        return DetailScreen.route(nikeModel: settings.arguments as NikeModel);
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text('Error'),
              ),
            ));
  }
}
