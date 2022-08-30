import 'package:flutter_test/flutter_test.dart';
import 'package:grocery_market/database/fake_database.dart';
import 'package:grocery_market/routes/home_page.dart';

void main() {
  testWidgets("Test Home page Item List", (widgetTester) async {
    await widgetTester.pumpWidget(const ItemsList());
    var test = find.text("Orange");
    expect(test, findsOneWidget);
  });
}
