import 'package:flutter/material.dart';
import 'package:grocery_market/route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Colors.black,
          shape: CircularNotchedRectangle(),
          elevation: 10,
        ),
      ),
      initialRoute: MyRoute.home,
      onGenerateRoute: MyRoute.generateRoute,
    );
  }
}
