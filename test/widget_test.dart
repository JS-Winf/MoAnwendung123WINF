import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:hotshop/app.dart';

void main() {
  testWidgets('renders landing text', (tester) async {
    await tester.pumpWidget(const App());
    expect(find.text('Hotshop - Coming Soon'), findsOneWidget);
  });
}
