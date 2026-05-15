import 'package:flutter/material.dart';
import '../screen/home_page.dart';
import '../screen/counter_page.dart';

class AppRoute {
  static const String home = 'home';
  static const String count = 'count';

  final _route = <String, WidgetBuilder>{
    home: (context) => const MyHomePage(title: "Home Page"),
    count: (context) => const CountPage(title: "Counter A & B Page"),
  };

  Map<String, WidgetBuilder> get getAll => _route;
}
