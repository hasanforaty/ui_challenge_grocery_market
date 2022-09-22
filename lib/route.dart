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
          var argument = settings.arguments as SecondPageArgument;
          return DetailPage(
            name: argument.name,
            imageAsset: argument.imageAsset,
            price: argument.price,
          );
        });
      default:
        return MaterialPageRoute(builder: (context) {
          return const HomePage();
        });
    }
  }
}

class SecondPageArgument {
  String name;
  String imageAsset;
  String price;

  SecondPageArgument({
    required this.name,
    required this.imageAsset,
    required this.price,
  });
}
