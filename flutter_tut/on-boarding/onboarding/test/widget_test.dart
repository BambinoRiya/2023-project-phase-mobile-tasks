// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:onboarding/add_task.dart';
import 'package:onboarding/home.dart';

import 'package:onboarding/main.dart';
import 'package:onboarding/toDo.dart';
import 'package:onboarding/add_task.dart';

void main() {
  testWidgets('Test Onboarding Page Navigation ', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: WelcomePage(),
    ));
    final  getStartedButton = find.byKey(const Key('getStartedButton'));
    await tester.tap(getStartedButton);
 
    expect(find.byType(Scaffold), findsOneWidget);
  });

  // testWidgets(description, (widgetTester) => null)
}
