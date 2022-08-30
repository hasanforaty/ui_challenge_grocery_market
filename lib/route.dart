import 'package:flutter/material.dart';
import 'package:grocery_market/routes/detail_page.dart';
import 'package:grocery_market/routes/home_page.dart';

class MyRoute {
  MyRoute._();
  static const home = "/";
  static const detail = "/detail";
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (context) {
          return const HomePage();
        });
      case detail:
        return MaterialPageRoute(builder: (context) {
          return const DetailPage(
            name: "",
            imageAsset: "",
          );
        });
      default:
        return MaterialPageRoute(builder: (context) {
          return const HomePage();
        });
    }
  }
}
