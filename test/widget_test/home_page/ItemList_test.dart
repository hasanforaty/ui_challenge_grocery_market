import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grocery_market/routes/home_page.dart';

void main() {
  group("All of Home page Item list Tests ", () {
    testWidgets("Test Home page Item List to find name", (widgetTester) async {
      await widgetTester.pumpWidget(
        const Directionality(
          textDirection: TextDirection.rtl,
          child: SellItems(
              name: "Orange", price: "12", imageAsset: "images/orange.jpg"),
        ),
      );
      var test = find.text("Orange");
      expect(test, findsOneWidget);
    });
    testWidgets("Test to find about Image", (widgetTester) async {
      await widgetTester.pumpWidget(
        const Directionality(
          textDirection: TextDirection.rtl,
          child: SellItems(
              name: "Orange", price: "12", imageAsset: "images/orange.jpg"),
        ),
      );
      var test = find.image(const AssetImage("images/orange.jpg"));
      expect(test, findsOneWidget);
    });
    testWidgets("Test to see several text Widget", (widgetTester) async {
      await widgetTester.pumpWidget(
        const Directionality(
          textDirection: TextDirection.rtl,
          child: SellItems(
              name: "Orange", price: "12", imageAsset: "images/orange.jpg"),
        ),
      );
      var test = find.byType(Text);
      expect(test, findsWidgets);
    });
  });
}
