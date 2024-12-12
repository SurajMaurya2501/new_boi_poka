import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("Testign Text", (WidgetTester tester) async {
    const textField = Text("Hello");
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: textField,
        ),
      ),
    );
    expect(find.byWidget(textField), findsOneWidget);
  });
}
