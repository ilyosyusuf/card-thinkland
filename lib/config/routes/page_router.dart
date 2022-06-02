import 'package:card/screens/view/card_page.dart';
import 'package:flutter/material.dart';

class MyRoute {
  static final MyRoute _instance = MyRoute._init();
  static MyRoute get instance => _instance;
  MyRoute._init();

  Route? onGenerateRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case '/card':
        return _pages(const CardPage());
      default:
    }
  }

  _pages(Widget page) {
    return MaterialPageRoute(builder: (context) => page);
  }
}